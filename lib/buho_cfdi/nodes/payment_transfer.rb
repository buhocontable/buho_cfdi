module Nodes
  class PaymentTransfer < ::BuhoCfdi::BaseNode
    attr_accessor(
      :base,              # BaseP         -   required
      :tax,               # ImpuestoP     -   required
      :factor_type,       # TipoFactorP   -   required
      :rate_or_fee,       # TasaOCuotaP   -   required
      :import,            # ImporteP      -   required
    )

  end
end