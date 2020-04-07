XML_BUILDING_STRATEGY = lambda do |xml|
  xml.Comprobante(Nodes::Receipt.new.to_hash) do
    namespace = xml.doc.root.add_namespace_definition('cfdi', 'http://www.sat.gob.mx/cfd/3')
    xml.doc.root.namespace = namespace

    xml.CfdiRelacionados(Nodes::CfdiRelated.new.to_hash) do
      xml.CfdiRelacionado(Nodes::Related.new.to_hash)
      xml.CfdiRelacionado(Nodes::Related.new.to_hash)
    end

    xml.Emisor(Nodes::Issuer.new.to_hash)

    xml.Receptor(Nodes::Receiver.new.to_hash)

    xml.Conceptos do
      xml.Concepto(Nodes::Concept.new.to_hash) do
        xml.Impuestos do
          xml.Traslados do
            xml.Traslado(Nodes::TaxTransferred.new.to_hash)
            xml.Traslado(Nodes::TaxTransferred.new.to_hash)
          end

          xml.Retenciones do
            xml.Retencion(Nodes::TaxDetained.new.to_hash)
            xml.Retencion(Nodes::TaxDetained.new.to_hash)
          end
        end

        xml.InformacionAduanera(Nodes::CustomsInformation.new.to_hash)

        xml.CuentaPredial(Nodes::PropertyAccount.new.to_hash)

        xml.Parte(Nodes::Part.new.to_hash)
      end

      xml.Concepto(Nodes::Concept.new.to_hash) do
        xml.Impuestos do
          xml.Traslados do
            xml.Traslado(Nodes::TaxTransferred.new.to_hash)
            xml.Traslado(Nodes::TaxTransferred.new.to_hash)
          end

          xml.Retenciones do
            xml.Retencion(Nodes::TaxDetained.new.to_hash)
            xml.Retencion(Nodes::TaxDetained.new.to_hash)
          end
        end

        xml.InformacionAduanera(Nodes::CustomsInformation.new.to_hash)

        xml.CuentaPredial(Nodes::PropertyAccount.new.to_hash)

        xml.Parte(Nodes::Part.new.to_hash)
      end
    end

    xml.Impuestos(Nodes::Taxes.new.to_hash) do
      xml.Traslados do
        xml.Traslado(Nodes::Transferred.new.to_hash)
        xml.Traslado(Nodes::Transferred.new.to_hash)
      end

      xml.Retenciones do
        xml.Retencion(Nodes::Detained.new.to_hash)
        xml.Retencion(Nodes::Detained.new.to_hash)
      end
    end
  end
end