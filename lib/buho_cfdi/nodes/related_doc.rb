module Nodes
  class RelatedDoc < ::BuhoCfdi::BaseNode
    attr_accessor(
      :uuid,              # IdDocumento      -   required
      :serie,             # Serie            -   required
      :folio,             # Folio            -   required
      :currency,          # MonedaDR         -   required
      :payment_number,    # NumParcialidad   -   required
      :exchange_rate,     # EquivalenciaDR   -   required
      :previous_debt,     # ImpSaldoAnt      -   required
      :paid_amount,       # ImpPagado        -   required
      :new_debt,          # ImpSaldoInsoluto -   required
      :taxable_code       # ObjetoImpDR      -   required
    )

  end
end