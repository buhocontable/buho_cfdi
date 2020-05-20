module Nodes
  class PayrollReceipt < ::BuhoCfdi::BaseNode
    DEFAULT = {
      'xsi:schemaLocation' => 'http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv33.xsd http://www.sat.gob.mx/nomina12 http://www.sat.gob.mx/sitio_internet/cfd/nomina/nomina12.xsd',
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
      :expedition_place
    )

    def to_hash
      super.merge! DEFAULT
    end
  end
end