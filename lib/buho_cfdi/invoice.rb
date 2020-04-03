module BuhoCfdi
  class Invoice < BaseNode
    
    attr_accessor(
      :expedition_place,
      :payment_method,
      :proof_type,
      :total,
      :subtotal,
      :currency,
      :certificate,
      :certificate_number, 
      :stamp,
      :payment_way,
      :created_at,
      :version,
      :concepts
    )

    validates_presence_of(
      :expedition_place,
      :payment_method,
      :proof_type,
      :total,
      :subtotal,
      :currency,
      :certificate,
      :certificate_number, 
      :stamp,
      :payment_way,
      :created_at,
      :version
    )

    def initialize(params = {})
      super
      @concepts = []
    end
  
    def transmitter=(data)
      data = Transmitter.new(data) unless data.is_a? Transmitter
      @transmitter = data
    end

    def receptor=(data)
      data = Receptor.new(data) unless data.is_a? Receptor
      @receptor = data
    end

    def concepts=(data)
      @concepts = []
      if data.is_a? Array
        data.map do |c|
          c = Concept.new(c) unless c.is_a? Concept
          @concepts << c
        end
      elsif data.is_a? Hash
        @concepts << Concept.new(data)
      elsif data.is_a? Concept
        @concepts << data
      end
      @concepts
    end

    def taxes=(data) 
        data.is_a?(Taxes) ? data : Taxes.new(data)
        @taxes = data
    end

    def to_x
      {
        'xmlns:cfdi' => 'http://www.sat.gob.mx/cfd/3',
        'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
        'xsi:schemaLocation' => 'http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv32.xsd',
        version: @version,
        fecha: @created_at,
        formaDePago: @payment_way,
        subTotal: format('%.2f', @subtotal),
        Moneda: @currency,
        total: format('%.2f', @total),
        metodoDePago: @payment_method,
        tipoDeComprobante: @proof_type,
        LugarExpedicion: @expedition_place
      }
    end

    def to_xml
      @builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.Comprobante(self.to_x) do
          ins = xml.doc.root.add_namespace_definition('cfdi', 'http://www.sat.gob.mx/cfd/3')
          xml.doc.root.namespace = ins
          xml.Emisor(@transmitter.to_x)
          xml.Receptor(@receptor.to_x)
          xml.Conceptos do
            @concepts.each do |concept|
              concept_complement = nil
              cc = concept.to_x.select { |_, v| v.present? }
              cc = cc.map do |k, v|
                v = format('%.2f', v) if v.is_a? Float
                [k, v]
              end.to_h
              xml.Concepto(cc) do
                xml.Impuestos do
                  xml.Traslados do
                    concept.taxes.transferred.each do |trans|
                      xml.Traslado(trans.to_x)
                    end
                    concept.taxes.detained.each do |trans|
                      xml.Traslado(trans.to_x)
                    end
                  end
                end
              end
            end
          end          
        end
      end
      @builder.to_xml
    end # to_xml


  end
end