XML_BUILDING_STRATEGY = lambda do |xml|
  xml.Comprobante(Nodes::Receipt.new.to_hash) do
    namespace = xml.doc.root.add_namespace_definition('cfdi', 'http://www.sat.gob.mx/cfd/3')
    xml.doc.root.namespace = namespace

    xml.Emisor(Nodes::Issuer.new.to_hash)

    xml.Receptor(Nodes::Receiver.new.to_hash)

    xml.Conceptos do
      xml.Concepto(Nodes::Receiver.new.to_hash) do
        xml.Impuestos do
          xml.Traslados do
            xml.Traslado(Nodes::TaxTransferred.new.to_hash)
          end
        end
      end

      xml.Concepto(Nodes::Receiver.new.to_hash) do
        xml.Impuestos do
          xml.Traslados do
            xml.Traslado(Nodes::TaxTransferred.new.to_hash)
          end
        end
      end
    end

    xml.Impuestos(Nodes::TaxTransferred.new.to_hash) do
      xml.Traslados do
        xml.Traslado(Nodes::Transferred.new.to_hash)
      end

      xml.Retenciones do
        xml.Retencion(Nodes::Detained.new.to_hash)
      end
    end
  end
end