module BuhoCfdi
  class PayrollBuilder

    attr_accessor(
      :params,
      :payroll_receipt
    )

    def initialize(params)
      @params = params

      build_receipt
      build_cfdi_related
      build_issuer
      build_receiver
      build_concepts
      build_payroll

      payroll_receipt
    end

    def build_receipt
      if params.include?(:receipt)
        @payroll_receipt = ::Nodes::PayrollReceipt.new params.fetch(:receipt)
      else
        nil
      end
    end

    def build_cfdi_related
      if params.fetch(:receipt).include?(:cfdi_related_attributes)
        @payroll_receipt.build_child! ::Nodes::CfdiRelated, params.fetch(:receipt).fetch(:cfdi_related_attributes)

        if params.fetch(:receipt).fetch(:cfdi_related_attributes).include?(:related_attributes)
          @payroll_receipt.nodes_cfdirelated.build_children ::Nodes::Related

          params.fetch(:receipt).fetch(:cfdi_related_attributes).fetch(:related_attributes).each do |params|
            @payroll_receipt.nodes_cfdirelated.nodes_related.add params
          end
        end
      else
        nil
      end
    end

    def build_issuer
      if params.include?(:receipt) && params.fetch(:receipt).include?(:issuer_attributes)
        @payroll_receipt.build_child! ::Nodes::Issuer, params.fetch(:receipt).fetch(:issuer_attributes)
      else
        nil
      end
    end

    def build_receiver
      if params.include?(:receipt) && params.fetch(:receipt).include?(:receiver_attributes)
        @payroll_receipt.build_child! ::Nodes::Receiver, params.fetch(:receipt).fetch(:receiver_attributes)
      else
        nil
      end
    end

    def build_concepts
      if params.include?(:receipt) && params.fetch(:receipt).include?(:concepts_attributes)
        @payroll_receipt.build_children ::Nodes::Concept

        params.fetch(:receipt).fetch(:concepts_attributes).each do |params|

          concept = @payroll_receipt.nodes_concept.add params

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

    def build_payroll
      if params.include?(:receipt) && params.fetch(:receipt).include?(:payroll_attributes)
        @payroll_receipt.build_child! ::Nodes::Payroll, params.fetch(:receipt).fetch(:payroll_attributes)

        if params.fetch(:receipt).fetch(:payroll_attributes).include?(:issuer_attributes)
          @payroll_receipt.nodes_payroll.build_child! ::Nodes::PayrollIssuer, params.fetch(:receipt).fetch(:payroll_attributes).fetch(:issuer_attributes)
        end

        if params.fetch(:receipt).fetch(:payroll_attributes).include?(:issuer_attributes)
          @payroll_receipt.nodes_payroll.build_child! ::Nodes::PayrollReceiver, params.fetch(:receipt).fetch(:payroll_attributes).fetch(:receiver_attributes)
        end

        if params.fetch(:receipt).fetch(:payroll_attributes).include?(:perceptions_attributes)
          @payroll_receipt.nodes_payroll.build_child! ::Nodes::Perceptions, params.fetch(:receipt).fetch(:payroll_attributes).fetch(:perceptions_attributes)

          if params.fetch(:receipt).fetch(:payroll_attributes).fetch(:perceptions_attributes).include?(:perception_attributes)
            @payroll_receipt.nodes_payroll.nodes_perceptions.build_children ::Nodes::Perception

            params.fetch(:receipt).fetch(:payroll_attributes).fetch(:perceptions_attributes).fetch(:perception_attributes).each do |params|
              @payroll_receipt.nodes_payroll.nodes_perceptions.nodes_perception.add params
            end
          end
        end

        if params.fetch(:receipt).fetch(:payroll_attributes).include?(:deductions_attributes)
          @payroll_receipt.nodes_payroll.build_child! ::Nodes::Deductions, params.fetch(:receipt).fetch(:payroll_attributes).fetch(:deductions_attributes)

          if params.fetch(:receipt).fetch(:payroll_attributes).fetch(:deductions_attributes).include?(:deduction_attributes)
            @payroll_receipt.nodes_payroll.nodes_deductions.build_children ::Nodes::Deduction

            params.fetch(:receipt).fetch(:payroll_attributes).fetch(:deductions_attributes).fetch(:deduction_attributes).each do |params|
              @payroll_receipt.nodes_payroll.nodes_deductions.nodes_deduction.add params
            end
          end
        end

        if params.fetch(:receipt).fetch(:payroll_attributes).include?(:other_payment_attributes)
            @payroll_receipt.nodes_payroll.build_children ::Nodes::OtherPayment
            params.fetch(:receipt).fetch(:payroll_attributes).fetch(:other_payment_attributes).each do |params|
              other_payment = @payroll_receipt.nodes_payroll.nodes_otherpayment.add params
              if params.include?(:employment_subsidy_attributes)
                other_payment.build_child! ::Nodes::EmploymentSubsidy, params.fetch(:employment_subsidy_attributes)
              end
            end
        end

        payroll_receipt
      end
    end
  end
end