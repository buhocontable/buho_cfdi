module Nodes
  class TaxTransferred < ::BuhoCfdi::BaseNode
    attr_accessor(
      :base,          # Base        -   required
      :tax,           # Impuesto    -   required
      :factor_type,   # TipoFactor  -   required
      :rate_or_fee,   # TasaOCuota  -   optional
      :import         # Importe     -   optional
    )

    validates_presence_of(
      :tax,
      :factor_type,
      :base
    )

    validates_presence_of(
      :rate_or_fee,
      :import
    ) unless :is_exempt?

    def is_exempt?
      factor_type == 'Exento'
    end
  end
end