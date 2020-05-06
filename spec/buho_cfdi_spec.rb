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
      {
        "receipt": {
          "version": "3.3",
          "serie": "shuhsuhsuhsw",
          "folio_number": "74777e8e8e",
          "date": "sjsjjsjs",
          "stamp": "jsjsjsjjs",
          "payment_method": "ikskskskis",
          "certificate_number": "osiskksj",
          "certificate": "jsjsjsjjsjs",
          "payment_conditions": "kjsksisosos",
          "subtotal": "jiksksksks",
          "discount": "jjjsjsjsjsj",
          "currency": "jsjksjdhdhd",
          "exchange_rate": "jsjsjdhdfhd",
          "total": "isjsxjdjf",
          "type_of_receipt": "jjsjsjjfd",
          "payment_method": "jjsjsjsjsd",
          "expedition_place": "jsjsjsjjs",
          "confirmation": "jjsjsjsjsjdjd",
          "cfdi_related_attributes": {
            "relationship_type": "jhususjujsujdius",
            "related_attributes": [
              {
                "uuid": "ijisjisjisjisjisj"
              }
            ]
          },
          "issuer_attributes": {
            "rfc": "hudshududhs",
            "name": "jdsjidjsijdi",
            "fiscal_regime": "jdisjdisjid" 
          },
          "receiver_attributes": {
            "rfc": "jdisjdisj",
            "name": "jdsjdijsijds",
            "tax_residency": "udisjdisjidjisjd",
            "tax_identity_registration_number": "djisjdisjidjsidjis",
            "cfdi_usage": "disjdisidisdjs" 
          },
          "concepts_attributes": [
            {
              "prod_or_svc_key": "",
              "identification_number": "",
              "quantity": "",
              "unit_measure_key": "",
              "unit_measure": "",
              "description": "",
              "unit_value": "",
              "amount": "",
              "discount": "",
              "transferred_attributes": [
                {
                  "base": "yysysy",
                  "tax": "uususuus",
                  "factor_type": "sjisjijis",
                  "rate_or_fee": "jsisjijsijs",
                  "import": "jsijsijsij"
                }
              ],
              "detained_attributes": [
                {
                  "base": "sjisjijsijs",
                  "tax": "sjisjijsijsi",
                  "factor_type": "sjijsijsijsi",
                  "rate_or_fee": "ssijisjisj",
                  "import": "sjijsisijisj" 
                }
              ],
              "customs_information_attributes": {
                "requirement_number": ""
              },
              "property_account_attributes": {
                "number": ""
              },
              "part_attributes": {
                "prod_or_svc_key": "",
                "identification_number": "",
                "quantity": "",
                "unit_measure": "",
                "description": "",
                "unit_value": "",
                "amount": ""
              }
            }
          ],
          "taxes_attributes": {
            "total_taxes_transferred": "",
            "total_taxes_detained": "",
            "transferred_attributes": [
              {
                "tax": "",
                "factor_type": "",
                "rate_or_fee": "",
                "import": "" 
              }
            ],
            "detained_attributes": [
              {
                "tax": "",
                "import": "" 
              }
            ]
          }
        }
      }
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

  describe '#cancellation' do
    pending
  end

  describe '#cfdi' do
    pending
  end

  describe '#process_cancellation' do
    pending
  end
end
