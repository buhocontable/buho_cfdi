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
      build_issuer
      build_receiver

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

    # def concepts
    # end

    # def taxes
    # end
  end
end