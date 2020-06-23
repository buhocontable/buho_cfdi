module Nodes
  class Deduction < ::BuhoCfdi::BaseNode
    attr_accessor(
      :deduction_type,           # TipoDeduccion     -   required
      :deduction_key,            # Clave             -   required
      :concept,                  # Concepto          -   required
      :amount                    # Importe           -   required
    )

    validates_presence_of(
      :deduction_type, 
      :deduction_key,
      :concept,
      :amount
    )
  end
end