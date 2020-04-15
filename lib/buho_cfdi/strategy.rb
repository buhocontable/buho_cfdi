require 'pry'

# params = {
#   "receipt": {
#     "version": "3.3",
#     "serie": "shuhsuhsuhsw",
#     "invoice": "74777e8e8e",
#     "date": "sjsjjsjs",
#     "stamp": "jsjsjsjjs",
#     "payment_method": "ikskskskis",
#     "certificate_number": "osiskksj",
#     "certificate": "jsjsjsjjsjs",
#     "payment_conditions": "kjsksisosos",
#     "subtotal": "jiksksksks",
#     "discount": "jjjsjsjsjsj",
#     "currency": "jsjksjdhdhd",
#     "exchange_rate": "jsjsjdhdfhd",
#     "total": "isjsxjdjf",
#     "type_of_receipt": "jjsjsjjfd",
#     "payment_method": "jjsjsjsjsd",
#     "expedition_place": "jsjsjsjjs",
#     "confirmation": "jjsjsjsjsjdjd",
#     "cfdi_related_attributes": {
#       "relationship_type": "jhususjujsujdius",
#       "related_attributes": [
#         {
#           "uuid": "ijisjisjisjisjisj"
#         }
#       ]
#     },
#     "issuer_attributes": {
#       "rfc": "hudshududhs",
#       "name": "jdsjidjsijdi",
#       "fiscal_regime": "jdisjdisjid" 
#     },
#     "receiver_attributes": {
#       "rfc": "jdisjdisj",
#       "name": "jdsjdijsijds",
#       "tax_residency": "udisjdisjidjisjd",
#       "tax_identity_registration_number": "djisjdisjidjsidjis",
#       "cfdi_usage": "disjdisidisdjs" 
#     }
#   }
# }

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

      xml.Conceptos do

        # receipt.nodes_concept.all.each do |concept|
        #   xml.Concepto(concept.to_hash) do
        #     xml.Impuestos do
        #       xml.Traslados do
        #         xml.Traslado(Nodes::TaxTransferred.new.to_hash)
        #         xml.Traslado(Nodes::TaxTransferred.new.to_hash)
        #       end

        #       xml.Retenciones do
        #         xml.Retencion(Nodes::TaxDetained.new.to_hash)
        #         xml.Retencion(Nodes::TaxDetained.new.to_hash)
        #       end
        #     end

        #     xml.InformacionAduanera(Nodes::CustomsInformation.new.to_hash)

        #     xml.CuentaPredial(Nodes::PropertyAccount.new.to_hash)

        #     xml.Parte(Nodes::Part.new.to_hash)
        #   end

        # end

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
end