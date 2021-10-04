PAYROLL_STRATEGY = lambda do |receipt|
  Nokogiri::XML::Builder.new do |xml|
    xml.Comprobante(receipt.to_hash) do
      xml.doc.root.namespace = xml.doc.root.add_namespace_definition('cfdi', 'http://www.sat.gob.mx/cfd/3')
      xml.doc.root.add_namespace_definition('xsi', 'http://www.w3.org/2001/XMLSchema-instance')
      xml.doc.root.add_namespace_definition('nomina12', 'http://www.sat.gob.mx/nomina12')

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
            end
          end
        end
      end
      if ((defined? receipt.nodes_payroll) && !receipt.nodes_payroll.blank?)
        xml.Complemento do
          xml["nomina12"].Nomina(receipt.nodes_payroll.to_hash) do

            if ((defined? receipt.nodes_payroll.nodes_payrollissuer) && receipt.nodes_payroll.nodes_payrollissuer)
              xml["nomina12"].Emisor(receipt.nodes_payroll.nodes_payrollissuer.to_hash)
            end

            if ((defined? receipt.nodes_payroll.nodes_payrollreceiver) && receipt.nodes_payroll.nodes_payrollreceiver)
              xml["nomina12"].Receptor(receipt.nodes_payroll.nodes_payrollreceiver.to_hash)
            end

            if (defined? receipt.nodes_payroll.nodes_perceptions) && receipt.nodes_payroll.nodes_perceptions
              xml["nomina12"].Percepciones(receipt.nodes_payroll.nodes_perceptions.to_hash) do
                receipt.nodes_payroll.nodes_perceptions.nodes_perception.all.each do |perception|
                  xml["nomina12"].Percepcion(perception.to_hash)
                end
              end
            end

            if (defined? receipt.nodes_payroll.nodes_deductions) && receipt.nodes_payroll.nodes_deductions
              xml["nomina12"].Deducciones(receipt.nodes_payroll.nodes_deductions.to_hash) do
                receipt.nodes_payroll.nodes_deductions.nodes_deduction.all.each do |deduction|
                  xml["nomina12"].Deduccion(deduction.to_hash)
                end
              end
            end

            if (defined? receipt.nodes_payroll.nodes_otherpayment) && receipt.nodes_payroll.nodes_otherpayment
              xml["nomina12"].OtrosPagos do
                receipt.nodes_payroll.nodes_otherpayment.all.each do |other_payment|
                  xml["nomina12"].OtroPago(other_payment.to_hash) do
                    if (defined? other_payment.nodes_employmentsubsidy) && other_payment.nodes_employmentsubsidy
                      xml["nomina12"].SubsidioAlEmpleo(other_payment.nodes_employmentsubsidy.to_hash)
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
end