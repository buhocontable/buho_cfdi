module BuhoCfdi
  class ParamsBuilder

    attr_accessor(
      :params,
      :receipt
    )

    def initialize(params)
      @params = params

      build_receipt
      build_cfdi_related
      build_global_info
      build_issuer
      build_receiver
      build_concepts
      build_taxes
      build_payment_info
      build_payroll

      receipt
    end

    def build_receipt
      if params.include?(:receipt)
        @receipt = ::Nodes::Receipt.new params.fetch(:receipt)
      else
        nil
      end
    end

    def build_cfdi_related
      if params.fetch(:receipt).include?(:cfdi_related_attributes)
        @receipt.build_child! ::Nodes::CfdiRelated, params.fetch(:receipt).fetch(:cfdi_related_attributes)

        if params.fetch(:receipt).fetch(:cfdi_related_attributes).include?(:related_attributes)
          @receipt.nodes_cfdirelated.build_children ::Nodes::Related

          params.fetch(:receipt).fetch(:cfdi_related_attributes).fetch(:related_attributes).each do |params|
            @receipt.nodes_cfdirelated.nodes_related.add params
          end
        end
      else
        nil
      end
    end

    def build_global_info
      if params.include?(:receipt) && params.fetch(:receipt).include?(:global_info_attributes)
        @receipt.build_child! ::Nodes::GlobalInfo, params.fetch(:receipt).fetch(:global_info_attributes)
      else
        nil
      end
    end

    def build_issuer
      if params.include?(:receipt) && params.fetch(:receipt).include?(:issuer_attributes)
        @receipt.build_child! ::Nodes::Issuer, params.fetch(:receipt).fetch(:issuer_attributes)
      else
        nil
      end
    end

    def build_receiver
      if params.include?(:receipt) && params.fetch(:receipt).include?(:receiver_attributes)
        @receipt.build_child! ::Nodes::Receiver, params.fetch(:receipt).fetch(:receiver_attributes)
      else
        nil
      end
    end

    def build_concepts
      if params.include?(:receipt) && params.fetch(:receipt).include?(:concepts_attributes)
        @receipt.build_children ::Nodes::Concept

        params.fetch(:receipt).fetch(:concepts_attributes).each do |params|

          concept = @receipt.nodes_concept.add params

          if params.include?(:transferred_attributes)
            concept.build_children ::Nodes::TaxTransferred

            params.fetch(:transferred_attributes).each do |params|
              concept.nodes_taxtransferred.add params
            end
          end

          if params.include?(:detained_attributes)
            concept.build_children ::Nodes::TaxDetained

            params.fetch(:detained_attributes).each do |params|
              concept.nodes_taxdetained.add params
            end
          end

          if params.include?(:customs_information_attributes)
            concept.build_child! ::Nodes::CustomsInformation, params.fetch(:customs_information_attributes)
          end

          if params.include?(:property_account_attributes)
            concept.build_child! ::Nodes::PropertyAccount, params.fetch(:property_account_attributes)
          end

          if params.include?(:part_attributes)
            concept.build_child! ::Nodes::Part, params.fetch(:part_attributes)
          end
        end
      else
        nil
      end
    end

    def build_taxes
      if params.include?(:receipt) && params.fetch(:receipt).include?(:taxes_attributes)
        @receipt.build_child! ::Nodes::Taxes, params.fetch(:receipt).fetch(:taxes_attributes)

        if params.fetch(:receipt).fetch(:taxes_attributes).include?(:transferred_attributes)
          @receipt.nodes_taxes.build_children ::Nodes::Transferred

          params.fetch(:receipt).fetch(:taxes_attributes).fetch(:transferred_attributes).each do |params|
            @receipt.nodes_taxes.nodes_transferred.add params
          end
        end

        if params.fetch(:receipt).fetch(:taxes_attributes).include?(:detained_attributes)
          @receipt.nodes_taxes.build_children ::Nodes::Detained

          params.fetch(:receipt).fetch(:taxes_attributes).fetch(:detained_attributes).each do |params|
            @receipt.nodes_taxes.nodes_detained.add params
          end
        end
      end
    end

    def build_payment_info
      return if params.dig(:receipt, :payment_attributes).nil?

      @receipt.build_child! ::Nodes::PaymentInfo, params.fetch(:receipt).fetch(:payment_attributes)
      @receipt.nodes_paymentinfo.build_child! ::Nodes::PaymentTotals, params.fetch(:receipt).fetch(:payment_attributes).fetch(:totals)
      @receipt.nodes_paymentinfo.build_children ::Nodes::RelatedDoc

      params.fetch(:receipt).fetch(:payment_attributes).fetch(:related_docs).each do |related_doc_params|
        related_doc = @receipt.nodes_paymentinfo.nodes_relateddoc.add related_doc_params

        # Handle document level retentions
        taxes_retentions = related_doc_params.dig(:taxes, :retentions)
        if taxes_retentions
          related_doc.build_children ::Nodes::RelatedDocRetention
          taxes_retentions.each do |retention|
            related_doc.nodes_relateddocretention.add retention
          end
        end

        # Handle document level transfers
        taxes_transfers = related_doc_params.dig(:taxes, :transfers)
        if taxes_transfers
          related_doc.build_children ::Nodes::RelatedDocTransfer
          taxes_transfers.each do |transfer|
            related_doc.nodes_relateddoctransfer.add transfer
          end
        end
      end

      # Handle payment level retentions
      payment_retentions = params.dig(:receipt, :payment_attributes, :taxes, :retentions)
      if payment_retentions
        @receipt.nodes_paymentinfo.build_children ::Nodes::PaymentRetention
        payment_retentions.each do |retention|
          @receipt.nodes_paymentinfo.nodes_paymentretention.add retention
        end
      end

      # Handle payment level transfers
      payment_transfers = params.dig(:receipt, :payment_attributes, :taxes, :transfers)
      if payment_transfers
        @receipt.nodes_paymentinfo.build_children ::Nodes::PaymentTransfer
        payment_transfers.each do |transfer|
          @receipt.nodes_paymentinfo.nodes_paymenttransfer.add transfer
        end
      end
    end

    # Build Nómina complement (merged from PayrollBuilder)
    def build_payroll
      return unless params.dig(:receipt, :payroll_attributes)

      payroll_attrs = params.fetch(:receipt).fetch(:payroll_attributes)
      @receipt.build_child! ::Nodes::Payroll, payroll_attrs

      # Payroll Issuer (Emisor del complemento)
      if payroll_attrs.include?(:issuer_attributes)
        @receipt.nodes_payroll.build_child! ::Nodes::PayrollIssuer, payroll_attrs.fetch(:issuer_attributes)
      end

      # Payroll Receiver (Receptor del complemento)
      if payroll_attrs.include?(:receiver_attributes)
        @receipt.nodes_payroll.build_child! ::Nodes::PayrollReceiver, payroll_attrs.fetch(:receiver_attributes)
      end

      # Perceptions (Percepciones)
      if payroll_attrs.include?(:perceptions_attributes)
        perceptions_attrs = payroll_attrs.fetch(:perceptions_attributes)
        @receipt.nodes_payroll.build_child! ::Nodes::Perceptions, perceptions_attrs

        if perceptions_attrs.include?(:perception_attributes)
          @receipt.nodes_payroll.nodes_perceptions.build_children ::Nodes::Perception
          perceptions_attrs.fetch(:perception_attributes).each do |perception_params|
            @receipt.nodes_payroll.nodes_perceptions.nodes_perception.add perception_params
          end
        end
      end

      # Deductions (Deducciones)
      if payroll_attrs.include?(:deductions_attributes)
        deductions_attrs = payroll_attrs.fetch(:deductions_attributes)
        @receipt.nodes_payroll.build_child! ::Nodes::Deductions, deductions_attrs

        if deductions_attrs.include?(:deduction_attributes)
          @receipt.nodes_payroll.nodes_deductions.build_children ::Nodes::Deduction
          deductions_attrs.fetch(:deduction_attributes).each do |deduction_params|
            @receipt.nodes_payroll.nodes_deductions.nodes_deduction.add deduction_params
          end
        end
      end

      # Other Payments (OtrosPagos)
      if payroll_attrs.include?(:other_payment_attributes)
        @receipt.nodes_payroll.build_children ::Nodes::OtherPayment
        payroll_attrs.fetch(:other_payment_attributes).each do |other_payment_params|
          other_payment = @receipt.nodes_payroll.nodes_otherpayment.add other_payment_params
          if other_payment_params.include?(:employment_subsidy_attributes)
            other_payment.build_child! ::Nodes::EmploymentSubsidy, other_payment_params.fetch(:employment_subsidy_attributes)
          end
        end
      end
    end
  end
end
