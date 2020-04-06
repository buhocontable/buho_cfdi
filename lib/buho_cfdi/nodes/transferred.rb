module Nodes
  class Transferred < ::BuhoCfdi::BaseNode
    attr_accessor(
      :tax,           # Impuesto    -   required
      :factor_type,   # TipoFactor  -   required
      :rate_or_fee,   # TasaOCuota  -   required
      :import         # Importe     -   required
    )

    validates_presence_of(
      :tax,
      :factor_type,
      :rate_or_fee,
      :import
    )
  end
end