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
end
