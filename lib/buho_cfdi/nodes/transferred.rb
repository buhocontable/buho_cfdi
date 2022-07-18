module Nodes
  class Transferred < ::BuhoCfdi::BaseNode
    attr_accessor(
      :tax,           # Impuesto    -   required
      :factor_type,   # TipoFactor  -   required
      :base,          # Base        -   required
      :rate_or_fee,   # TasaOCuota  -   required when not exempt
      :import         # Importe     -   required when not exempt
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