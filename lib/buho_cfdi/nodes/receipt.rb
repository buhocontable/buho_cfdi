module Nodes
  class Receipt < ::BuhoCfdi::BaseNode
    DEFAULT = {
      'xsi:schemaLocation' => 'http://www.sat.gob.mx/cfd/4 http://www.sat.gob.mx/sitio_internet/cfd/4/cfdv40.xsd',
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
      :payment_conditions,        # CondicionesDePago   -     optional
      :subtotal,                  # SubTotal            -     required
      :discount,                  # Descuento           -     optional
      :currency,                  # Moneda              -     required
      :exchange_rate,             # TipoCambio          -     optional
      :total,                     # Total               -     required
      :type_of_receipt,           # TipoDeComprobante   -     required
      :payment_method,            # MetodoPago          -     optional
      :expedition_place,          # LugarExpedicion     -     required
      :confirmation,              # Confirmacion        -     optional,
      :export_code                # Exportacion       -     required
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
      # Set schemaLocation based on document type
      case @type_of_receipt
      when 'P' # Pagos
        DEFAULT['xsi:schemaLocation'] = 'http://www.sat.gob.mx/cfd/4 http://www.sat.gob.mx/sitio_internet/cfd/4/cfdv40.xsd http://www.sat.gob.mx/Pagos20 http://www.sat.gob.mx/sitio_internet/cfd/Pagos/Pagos20.xsd'
      when 'N' # Nómina
        DEFAULT['xsi:schemaLocation'] = 'http://www.sat.gob.mx/cfd/4 http://www.sat.gob.mx/sitio_internet/cfd/4/cfdv40.xsd http://www.sat.gob.mx/nomina12 http://www.sat.gob.mx/sitio_internet/cfd/nomina/nomina12.xsd'
      else
        DEFAULT['xsi:schemaLocation'] = 'http://www.sat.gob.mx/cfd/4 http://www.sat.gob.mx/sitio_internet/cfd/4/cfdv40.xsd'
      end
      super.merge! DEFAULT
    end
  end
end