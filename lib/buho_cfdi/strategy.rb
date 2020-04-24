XML_BUILDING_STRATEGY = lambda do |receipt|
  Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
    xml.Comprobante(receipt.to_hash) do
      xml.doc.root.namespace = xml.doc.root.add_namespace_definition('cfdi', 'http://www.sat.gob.mx/cfd/3')
      xml.doc.root.add_namespace_definition('xsi', 'http://www.w3.org/2001/XMLSchema-instance')

      if receipt.nodes_cfdirelated
        xml.CfdiRelacionados(receipt.nodes_cfdirelated.to_hash) do

          if receipt.nodes_cfdirelated.nodes_related
            receipt.nodes_cfdirelated.nodes_related.all.each do |related|
              xml.CfdiRelacionado(related.to_hash)
            end
          end
        end
      end

      xml.Emisor(receipt.nodes_issuer.to_hash) if receipt.nodes_issuer

      xml.Receptor(receipt.nodes_receiver.to_hash) if receipt.nodes_receiver

      if receipt.nodes_concept
        xml.Conceptos do
          receipt.nodes_concept.all.each do |concept|
            xml.Concepto(concept.to_hash) do
              xml.Impuestos do
                if concept.nodes_taxtransferred
                  xml.Traslados do
                    concept.nodes_taxtransferred.all.each do |transferred|
                      xml.Traslado(transferred.to_hash)
                    end
                  end
                end

                if concept.nodes_taxdetained
                  xml.Retenciones do
                    concept.nodes_taxdetained.all.each do |detained|
                      xml.Retencion(detained.to_hash)
                    end
                  end
                end
              end

              xml.InformacionAduanera(concept.nodes_customsinformation.to_hash) if concept.nodes_customsinformation

              xml.CuentaPredial(concept.nodes_propertyaccount.to_hash) if concept.nodes_propertyaccount

              xml.Parte(concept.nodes_part.to_hash) if concept.nodes_part
            end
          end
        end
      end

      if receipt.nodes_taxes
        xml.Impuestos(receipt.nodes_taxes.to_hash) do
          xml.Traslados do
            if receipt.nodes_taxes.nodes_transferred
              receipt.nodes_taxes.nodes_transferred.all.each do |transferred|
                xml.Traslado(transferred.to_hash)
              end
            end
          end

          xml.Retenciones do
            if receipt.nodes_taxes.nodes_detained
              receipt.nodes_taxes.nodes_detained.all.each do |detained|
                xml.Retencion(detained.to_hash)
              end
            end
          end
        end
      end
    end
  end
end