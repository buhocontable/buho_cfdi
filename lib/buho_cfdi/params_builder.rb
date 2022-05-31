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
      if params.include?(:receipt) && params.fetch(:receipt).include?(:payment_attributes)
        @receipt.build_child! ::Nodes::PaymentInfo, params.fetch(:receipt).fetch(:payment_attributes)
        @receipt.nodes_paymentinfo.build_child! ::Nodes::PaymentTotals, params.fetch(:receipt).fetch(:payment_attributes).fetch(:totals)
        @receipt.nodes_paymentinfo.build_children ::Nodes::RelatedDoc

          params.fetch(:receipt).fetch(:payment_attributes).fetch(:related_docs).each do |params|
            related_doc = @receipt.nodes_paymentinfo.nodes_relateddoc.add params
            if !params[:taxes].blank? && !params[:taxes][:transfers].blank?
              related_doc.build_children ::Nodes::RelatedDocTransfer
              params[:taxes][:transfers].each do |transfer|
                related_doc.nodes_relateddoctransfer.add transfer
              end
            end

            if !params[:taxes].blank? && !params[:taxes][:retentions].blank?
              related_doc.build_children ::Nodes::RelatedDocRetention
              params[:taxes][:retentions].each do |retention|
                related_doc.nodes_relateddocretention.add retention
              end
            end
          end
      else
        nil
      end
    end
  end
end