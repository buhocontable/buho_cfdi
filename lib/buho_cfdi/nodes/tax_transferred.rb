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
      :base,
      :tax,
      :factor_type,
    )
  end
end