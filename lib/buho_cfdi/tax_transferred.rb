module BuhoCfdi 
    class TaxTransferred < BaseNode
      attr_accessor(
        :base,
        :tax,
        :rate,
        :import,
        :factor_type
      )

      validates_presence_of(
        :base,
        :tax,
        :rate,
        :import,
        :factor_type
      )

      def to_x
        {
          base: @base,
          tax: @tax,
          rate: @rate,
          import: @import,
          factor_type: @factor_type
        }
      end
      
    end
end