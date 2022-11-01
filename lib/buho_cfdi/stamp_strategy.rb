STAMP_STRATEGY = lambda do |receipt|
  Nokogiri::XML::Builder.new do |xml|
    xml.Comprobante(receipt.to_hash) do
      
      xml.doc.root.namespace = xml.doc.root.add_namespace_definition('cfdi', 'http://www.sat.gob.mx/cfd/4')
      xml.doc.root.add_namespace_definition('xsi', 'http://www.w3.org/2001/XMLSchema-instance')
      if ((defined? receipt.nodes_paymentinfo) && receipt.nodes_paymentinfo)
        xml.doc.root.add_namespace_definition('pago20', 'http://www.sat.gob.mx/Pagos20')
      end

      xml.InformacionGlobal(receipt.nodes_globalinfo.to_hash) if ((defined? receipt.nodes_globalinfo) && receipt.nodes_globalinfo)

      if ((defined? receipt.nodes_cfdirelated) && receipt.nodes_cfdirelated)
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
              if ((defined? concept.nodes_taxtransferred) && concept.nodes_taxtransferred ) || ((defined? concept.nodes_taxdetained) && concept.nodes_taxdetained)
                xml.Impuestos do
                  if (defined? concept.nodes_taxtransferred) && concept.nodes_taxtransferred
                    xml.Traslados do
                      concept.nodes_taxtransferred.all.each do |transferred|
                        xml.Traslado(transferred.to_hash)
                      end
                    end
                  end

                  if (defined? concept.nodes_taxdetained) && concept.nodes_taxdetained
                    xml.Retenciones do
                      concept.nodes_taxdetained.all.each do |detained|
                        xml.Retencion(detained.to_hash)
                      end
                    end
                  end
                end
              end

              xml.InformacionAduanera(concept.nodes_customsinformation.to_hash) if ((defined? concept.nodes_customsinformation) && concept.nodes_customsinformation)

              xml.CuentaPredial(concept.nodes_propertyaccount.to_hash) if ((defined? concept.nodes_propertyaccount) && concept.nodes_propertyaccount)

              xml.Parte(concept.nodes_part.to_hash) if ((defined?  concept.nodes_part) && concept.nodes_part)
            end
          end
        end
      end
      
      if ((defined? receipt.nodes_taxes) && !receipt.nodes_taxes.blank?)
        xml.Impuestos(receipt.nodes_taxes.to_hash) do
          if ((defined? receipt.nodes_taxes.nodes_detained) && receipt.nodes_taxes.nodes_detained)
            xml.Retenciones do
              receipt.nodes_taxes.nodes_detained.all.each do |detained|
                xml.Retencion(detained.to_hash)
              end
            end
          end
          if ((defined? receipt.nodes_taxes.nodes_transferred) && receipt.nodes_taxes.nodes_transferred)
            xml.Traslados do
              receipt.nodes_taxes.nodes_transferred.all.each do |transferred|
                xml.Traslado(transferred.to_hash)
              end
            end
          end
        end
      end

      if ((defined? receipt.nodes_paymentinfo) && receipt.nodes_paymentinfo)
        xml.Complemento do
          namespaced_node = xml['pago20']
          namespaced_node.Pagos({Version: "2.0"}) do
            namespaced_node.Totales(receipt.nodes_paymentinfo.nodes_paymenttotals.to_hash) 
            namespaced_node.Pago(receipt.nodes_paymentinfo.to_hash) do
              receipt.nodes_paymentinfo.nodes_relateddoc.all.each do |related|
                namespaced_node.DoctoRelacionado(related.to_hash) do

                  namespaced_node.ImpuestosDR do
                    if ((defined? related.nodes_relateddoctransfer) && related.nodes_relateddoctransfer)
                      namespaced_node.TrasladosDR do
                        related.nodes_relateddoctransfer.all.each do |transfer|
                          namespaced_node.TrasladoDR(transfer.to_hash)
                        end
                      end
                    end
                  end
                end
              end
              namespaced_node.ImpuestosP do
                namespaced_node.TrasladosP do
                  receipt.nodes_paymentinfo.nodes_paymenttransfer.all.each do |transfer|
                    namespaced_node.TrasladoP(transfer.to_hash)
                  end
                end
              end
            end 
          end
        end
      end

    end
  end
end