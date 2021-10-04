module Nodes
  class OtherPayment < ::BuhoCfdi::BaseNode
    attr_accessor(
      :other_payment_type,            # TipoOtroPago    -   required
      :other_payment_key,             # Clave           -   required
      :concept,                       # Concepto        -   required
      :amount,                        # Importe         -   required
    )

    validates_presence_of(
      :other_payment_type, 
      :other_payment_key,
      :concept,
      :amount
    )
  end
end