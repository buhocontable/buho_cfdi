module Nodes
  class PayrollReceipt < ::BuhoCfdi::BaseNode
    # CFDI 4.0 schemaLocation (upgraded from 3.3)
    DEFAULT = {
      'xsi:schemaLocation' => 'http://www.sat.gob.mx/cfd/4 http://www.sat.gob.mx/sitio_internet/cfd/4/cfdv40.xsd http://www.sat.gob.mx/nomina12 http://www.sat.gob.mx/sitio_internet/cfd/nomina/nomina12.xsd',
    }

    attr_accessor(
      :version,                   # Version             -     required
      :serie,                     # Serie               -     optional
      :folio_number,              # Folio               -     optional
      :date,                      # Fecha               -     required
      :stamp,                     # Sello               -     required
      :payment_way,               # FormaPago           -     optional
      :certificate_number,        # NoCertificado       -     required
      :certificate,               # Certificado         -     required
      :subtotal,                  # SubTotal            -     required
      :discount,                  # Descuento           -     optional
      :currency,                  # Moneda              -     required
      :total,                     # Total               -     required
      :type_of_receipt,           # TipoDeComprobante   -     required
      :export_code,               # Exportacion         -     required (CFDI 4.0)
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
      :export_code,
      :expedition_place
    )

    def to_hash
      super.merge! DEFAULT
    end
  end
end