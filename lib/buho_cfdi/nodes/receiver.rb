module Nodes
  class Receiver < ::BuhoCfdi::BaseNode
    attr_accessor(
      :rfc,                               # Rfc               -   required
      :name,                              # Nombre            -   optional
      :tax_residency,                     # ResidenciaFiscal  -   optional
      :tax_identity_registration_number,  # NumRegIdTrib      -   optional
      :cfdi_usage                         # UsoCFDI           -   required
    )

    validates_presence_of :rfc, :cfdi_usage
  end
end