module Nodes
  class PaymentInfo < ::BuhoCfdi::BaseNode
    attr_accessor(
      :payment_date,   # FechaPago      -   required
      :payment_form,   # FormaDePagoP   -   required
      :currency,       # MonedaP        -   required
      :exchange_rate,  # TipoCambioP    -   required
      :amount,         # Monto          -   required
      :bank_name       # NomBancoOrdExt -   required
    )

    validates_presence_of :payment_date, :payment_form, :currency, :exchange_rate, :amount
  end
end