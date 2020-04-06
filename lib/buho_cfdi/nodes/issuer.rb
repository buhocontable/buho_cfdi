module Nodes
  class Issuer < ::BuhoCfdi::BaseNode
    attr_accessor(
      :rfc,             # Rfc             -   required
      :name,            # Nombre          -   optional
      :fiscal_regime    # RegimenFiscal   -   required
    )

    validates_presence_of :rfc, :fiscal_regime
  end
end