RSpec.describe BuhoCfdi do
  it "has a version number" do
    expect(BuhoCfdi::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end
end

RSpec.describe BuhoCfdi::XmlProcessor do
  subject{ BuhoCfdi::XmlProcessor.new(hola: "dhdh") }

  it { should respond_to(:stamp_strategy) }
  it { should respond_to(:receipt) }
  it { should respond_to(:cancellation_strategy) }
  it { should respond_to(:cancellation) }
  it { should respond_to(:cfdi) }
  it { should respond_to(:params) }

  describe '#params' do
    it "is expected that return a kind of Hash" do
      expect(subject.params).to be_kind_of Hash
    end
  end

  describe '#stapm_strategy' do
    it "is expected that return a kind of lambda" do
      expect(subject.stamp_strategy).to be_kind_of Proc
    end
  end

  describe '#cancellation_strategy' do
    it "is expected that return a kind of lambda" do
      expect(subject.cancellation_strategy).to be_kind_of Proc
    end
  end

  context 'Generate a XML kind of stamp' do
    let :params do
      cfdi_params
    end

    describe '#process_xml' do
      subject{ BuhoCfdi::XmlProcessor.new(params) }

      it 'is expected to be kind of Nokogiri::XML::Builder' do
        expect(subject.process_xml).to be_kind_of(Nokogiri::XML::Builder)
      end
    end

    describe '#receipt' do
      subject{ BuhoCfdi::XmlProcessor.new(params) }

      before { subject.process_xml }

      it 'is expected to be kind of BuhoCfdi::ParamsBuilder' do
        expect(subject.receipt).to be_kind_of(Nodes::Receipt)
      end
    end

    describe '#cfdi' do
      subject{ BuhoCfdi::XmlProcessor.new(params) }

      before { subject.process_xml }

      it 'is expected to be kind of BuhoCfdi::ParamsBuilder' do
        expect(subject.cfdi).to be_kind_of(Nokogiri::XML::Builder)
      end
    end
  end

  context "generate a XML kind of cancellation" do

    let :params do
      cancellation_params
    end

    subject{ BuhoCfdi::XmlProcessor.new(params) }

    describe '#process_cancellation' do

      it "is expected to be kind of Nokogiri::XML::Builder" do
        expect(subject.process_cancellation).to be_kind_of(Nokogiri::XML::Builder)
      end
    end

    describe '#cancellation' do
      before { subject.process_cancellation }

      it "is expected to be kind of Nodes::Cancellation" do
        expect(subject.cancellation).to be_kind_of(Nodes::Cancellation)
      end
    end

    describe '#cfdi' do
      before { subject.process_cancellation }

      it 'is expected to be kind of BuhoCfdi::ParamsBuilder' do
        expect(subject.cfdi).to be_kind_of(Nokogiri::XML::Builder)
      end
    end
  end

  context "generate a XML kind of payroll" do

    let :params do
      payroll_params
    end

    subject{ BuhoCfdi::XmlProcessor.new(params) }

    describe '#process_payroll' do

      it "is expected to be kind of Nokogiri::XML::Builder" do
        expect(subject.process_payroll).to be_kind_of(Nokogiri::XML::Builder)
      end
    end

    describe '#payroll' do
      before { subject.process_payroll }

      it "is expected to be kind of Nodes::PayrollReceipt" do
        expect(subject.payroll_receipt).to be_kind_of(Nodes::PayrollReceipt)
      end
    end

    describe '#cfdi' do
      before { subject.process_payroll }

      it 'is expected to be kind of BuhoCfdi::ParamsBuilder' do
        expect(subject.cfdi).to be_kind_of(Nokogiri::XML::Builder)
      end
    end

  end

  context "generate payment complement XML with retentions" do
    let(:params) { payment_complement_params }

    subject(:xml_doc) { Nokogiri::XML BuhoCfdi::XmlProcessor.new(params).process_xml.to_xml }

    describe '#process_xml with payment retentions' do
      it "generates XML with proper payment-level retention structure" do
        # Verify payment-level retention exists in correct hierarchy
        payment_retention_xpath = "//cfdi:Complemento/pago20:Pagos/pago20:Pago/pago20:ImpuestosP/pago20:RetencionesP/pago20:RetencionP"
        retention_nodes = xml_doc.xpath(payment_retention_xpath,
                                       'cfdi' => 'http://www.sat.gob.mx/cfd/4',
                                       'pago20' => 'http://www.sat.gob.mx/Pagos20')

        expect(retention_nodes.length).to eq(1)
        expect(retention_nodes.first['ImpuestoP']).to eq('001')
        expect(retention_nodes.first['ImporteP']).to eq('251.050000')
      end

      it "generates XML with proper document-level retention structure" do
        # Verify document-level retention exists in correct hierarchy
        doc_retention_xpath = "//cfdi:Complemento/pago20:Pagos/pago20:Pago/pago20:DoctoRelacionado/pago20:ImpuestosDR/pago20:RetencionesDR/pago20:RetencionDR"
        retention_nodes = xml_doc.xpath(doc_retention_xpath,
                                       'cfdi' => 'http://www.sat.gob.mx/cfd/4',
                                       'pago20' => 'http://www.sat.gob.mx/Pagos20')

        expect(retention_nodes.length).to eq(1)
        expect(retention_nodes.first['BaseDR']).to eq('20084.000000')
        expect(retention_nodes.first['ImpuestoDR']).to eq('001')
        expect(retention_nodes.first['TipoFactorDR']).to eq('Tasa')
        expect(retention_nodes.first['TasaOCuotaDR']).to eq('0.012500')
        expect(retention_nodes.first['ImporteDR']).to eq('251.050000')
      end

      it "generates XML with complete payment complement structure hierarchy" do
        # Verify main structure exists
        expect(xml_doc.xpath("//cfdi:Complemento", 'cfdi' => 'http://www.sat.gob.mx/cfd/4')).not_to be_empty
        expect(xml_doc.xpath("//pago20:Pagos[@Version='2.0']", 'pago20' => 'http://www.sat.gob.mx/Pagos20')).not_to be_empty

        # Verify ImpuestosP contains both RetencionesP and TrasladosP
        impuestos_p_xpath = "//pago20:Pago/pago20:ImpuestosP"
        impuestos_p = xml_doc.xpath(impuestos_p_xpath, 'pago20' => 'http://www.sat.gob.mx/Pagos20')
        expect(impuestos_p).not_to be_empty

        # Check RetencionesP exists within ImpuestosP
        retenciones_p = impuestos_p.first.xpath("./pago20:RetencionesP", 'pago20' => 'http://www.sat.gob.mx/Pagos20')
        expect(retenciones_p).not_to be_empty

        # Check TrasladosP exists within ImpuestosP
        traslados_p = impuestos_p.first.xpath("./pago20:TrasladosP", 'pago20' => 'http://www.sat.gob.mx/Pagos20')
        expect(traslados_p).not_to be_empty

        # Verify ImpuestosDR contains both RetencionesDR and TrasladosDR
        impuestos_dr_xpath = "//pago20:DoctoRelacionado/pago20:ImpuestosDR"
        impuestos_dr = xml_doc.xpath(impuestos_dr_xpath, 'pago20' => 'http://www.sat.gob.mx/Pagos20')
        expect(impuestos_dr).not_to be_empty

        # Check RetencionesDR exists within ImpuestosDR
        retenciones_dr = impuestos_dr.first.xpath("./pago20:RetencionesDR", 'pago20' => 'http://www.sat.gob.mx/Pagos20')
        expect(retenciones_dr).not_to be_empty

        # Check TrasladosDR exists within ImpuestosDR
        traslados_dr = impuestos_dr.first.xpath("./pago20:TrasladosDR", 'pago20' => 'http://www.sat.gob.mx/Pagos20')
        expect(traslados_dr).not_to be_empty
      end

      it "generates well-formed XML with correct namespaces" do
        # Verify the XML is well-formed
        expect(xml_doc.errors).to be_empty

        # Verify namespaces are correctly declared
        root_element = xml_doc.root
        expect(root_element.namespace_definitions.map(&:href)).to include(
          'http://www.sat.gob.mx/cfd/4',
          'http://www.sat.gob.mx/Pagos20',
          'http://www.w3.org/2001/XMLSchema-instance'
        )
      end

      it "maintains proper ordering of retention and transfer elements" do
        # In ImpuestosP, RetencionesP should come before TrasladosP
        impuestos_p = xml_doc.xpath("//pago20:ImpuestosP", 'pago20' => 'http://www.sat.gob.mx/Pagos20').first
        children = impuestos_p.children.select { |child| child.element? }

        retenciones_index = children.find_index { |child| child.name == 'RetencionesP' }
        traslados_index = children.find_index { |child| child.name == 'TrasladosP' }

        expect(retenciones_index).to be < traslados_index

        # In ImpuestosDR, RetencionesDR should come before TrasladosDR
        impuestos_dr = xml_doc.xpath("//pago20:ImpuestosDR", 'pago20' => 'http://www.sat.gob.mx/Pagos20').first
        children = impuestos_dr.children.select { |child| child.element? }

        retenciones_index = children.find_index { |child| child.name == 'RetencionesDR' }
        traslados_index = children.find_index { |child| child.name == 'TrasladosDR' }

        expect(retenciones_index).to be < traslados_index
      end
    end
  end

  context "generate payment complement XML with multiple retentions" do
    let(:params) { multiple_payment_retentions_params }
    subject(:xml_doc) { Nokogiri::XML BuhoCfdi::XmlProcessor.new(params).process_xml.to_xml }

    describe '#process_xml with multiple payment retentions' do
      it "generates XML with multiple payment-level retention nodes" do
        # Verify payment-level retentions exist in correct hierarchy
        payment_retention_xpath = "//cfdi:Complemento/pago20:Pagos/pago20:Pago/pago20:ImpuestosP/pago20:RetencionesP/pago20:RetencionP"
        retention_nodes = xml_doc.xpath(payment_retention_xpath,
                                       'cfdi' => 'http://www.sat.gob.mx/cfd/4',
                                       'pago20' => 'http://www.sat.gob.mx/Pagos20')

        expect(retention_nodes.length).to eq(2)

        # Check first retention (ISR)
        expect(retention_nodes[0]['ImpuestoP']).to eq('001')
        expect(retention_nodes[0]['ImporteP']).to eq('251.050000')

        # Check second retention (IVA)
        expect(retention_nodes[1]['ImpuestoP']).to eq('002')
        expect(retention_nodes[1]['ImporteP']).to eq('200.000000')
      end

      it "maintains all retention nodes within the same RetencionesP container" do
        # Verify that all retention nodes are properly nested within RetencionesP
        retenciones_p_xpath = "//cfdi:Complemento/pago20:Pagos/pago20:Pago/pago20:ImpuestosP/pago20:RetencionesP"
        retenciones_container = xml_doc.xpath(retenciones_p_xpath,
                                             'cfdi' => 'http://www.sat.gob.mx/cfd/4',
                                             'pago20' => 'http://www.sat.gob.mx/Pagos20')

        expect(retenciones_container.length).to eq(1)

        # Check that this single container has 2 child retention nodes
        retention_children = retenciones_container.first.xpath("./pago20:RetencionP",
                                                              'pago20' => 'http://www.sat.gob.mx/Pagos20')
        expect(retention_children.length).to eq(2)
      end

      it "generates well-formed XML with multiple retentions" do
        # Verify the XML is still well-formed with multiple nodes
        expect(xml_doc.errors).to be_empty

        # Verify proper structure is maintained
        expect(xml_doc.xpath("//cfdi:Complemento", 'cfdi' => 'http://www.sat.gob.mx/cfd/4')).not_to be_empty
        expect(xml_doc.xpath("//pago20:Pagos[@Version='2.0']", 'pago20' => 'http://www.sat.gob.mx/Pagos20')).not_to be_empty
      end
    end
  end
end
