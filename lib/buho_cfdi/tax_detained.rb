module BuhoCfdi
    class TaxDetained < BaseNode
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
          Base: @base,
          Impuesto: @tax,
          TasaOCuota: @rate,
          Importe: @import,
          TipoFactor: @factor_type
        }
      end
      
    end
end
 