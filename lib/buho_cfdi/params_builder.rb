module BuhoCfdi
  class ParamsBuilder
    class << self
      attr_accessor :params

      def loquesea(params)
        @params = params
      end

      def receipt
      end

      def issuer
      end

      def receiver
      end

      def concepts
      end

      def taxes
      end
    end
  end
end