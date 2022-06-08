module Nodes
  class RelatedDocTransfer < ::BuhoCfdi::BaseNode
    attr_accessor(
      :base,              # BaseDR         -   required
      :tax,               # ImpuestoDR     -   required
      :factor_type,       # TipoFactorDR   -   required
      :rate_or_fee,       # TasaOCuotaDR   -   required
      :import,            # ImporteDR      -   required
    )

  end
end