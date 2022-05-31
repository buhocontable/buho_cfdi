module Nodes
  class PaymentTotals < ::BuhoCfdi::BaseNode
    attr_accessor(
      :total_retained_iva,               # TotalRetencionesIVA            -   required
      :total_retained_isr,               # TotalRetencionesISR            -   required
      :total_retained_ieps,              # TotalRetencionesIEPS           -   required
      :total_transferred_base_iva_16,    # TotalTrasladosBaseIVA16        -   required
      :total_transferred_tax_iva_16,     # TotalTrasladosImpuestoIVA16    -   required
      :total_transferred_base_iva_8,     # TotalTrasladosBaseIVA8         -   required
      :total_transferred_tax_iva_8,      # TotalTrasladosImpuestoIVA8     -   required
      :total_transferred_base_iva_0,     # TotalTrasladosBaseIVA0         -   required
      :total_transferred_tax_iva_0,      # TotalTrasladosImpuestoIVA0     -   required
      :total_transferred_base_iva_exempt,# TotalTrasladosBaseIVAExento    -   required
      :total_payment_amount              # MontoTotalPagos                -   required
    )

  end
end