module Nodes
  class Receipt < ::BuhoCfdi::BaseNode
    attr_accessor(
      :version,                   # Version             -     required
      :serie,                     # Serie               -     optional
      :invoice,                   # Folio               -     optional
      :date,                      # Fecha               -     required
      :stamp,                     # Sello               -     required
      :payment_method,            # FormaPago           -     optional
      :certificate_number,        # NoCertificado       -     required
      :certificate,               # Certificado         -     required
      :payment_conditions,        # CondicionesDePago   -     optional
      :subtotal,                  # SubTotal            -     required
      :discount,                  # Descuento           -     optional
      :currency,                  # Moneda              -     required
      :exchange_rate,             # TipoCambio          -     optional
      :total,                     # Total               -     required
      :type_of_receipt,           # TipoDeComprobante   -     required
      :payment_method,            # MetodoPago          -     optional
      :expedition_place,          # LugarExpedicion     -     required
      :confirmation               # Confirmacion        -     optional
    )

    validates_presence_of(
      :version,
      :date,
      :stamp,
      :certificate_number,
      :certificate,
      :subtotal,
      :currency,
      :total,
      :type_of_receipt,
      :expedition_place,
    )
  end
end