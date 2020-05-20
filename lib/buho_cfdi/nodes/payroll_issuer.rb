module Nodes
  class PayrollIssuer < ::BuhoCfdi::BaseNode
    attr_accessor(
      :curp,                      # Curp              -   required
      :employer_registration,     # RegistroPatronal  -   optional
      :rfc_origin_employer        # RfcPatronOrigen   -   required
    )

    validates_presence_of :employer_registration
  end
end