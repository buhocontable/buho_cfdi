RSpec.describe BuhoCfdi::CancellationBuilder do

  let :params do 
    {
      "cancellation":{
      "date":"",
      "rfc":"",
      "uuid_attributes":[
          {"uuid": ""},
          {"uuid": ""},
          {"uuid": ""}
        ]
      }
    }
  end

  subject{BuhoCfdi::CancellationBuilder.new(params)}

  describe "#params" do
    it "is expected that return a kind of Hash" do
      expect(subject.params).to be_kind_of Hash
    end
  end

  describe "#build_cancellation" do
    context "with valid params" do
      it "is expected that return a kind of Nodes::Cancellation" do
        expect(subject.build_cancellation).to be_kind_of Nodes::Cancellation
      end
    end

    context "with invalid params" do
      subject{BuhoCfdi::CancellationBuilder.new(version: "3.3")}

      it "is expected that return nil" do
        expect(subject.build_cancellation).to be_nil
      end
    end
  end
  describe "#cancellation" do
    context "with params cancellation" do
      it "is expected that return a kind of Nodes::Cancellation" do
        expect(subject.cancellation).to be_kind_of Nodes::Cancellation
      end
    end

    context "with params cancellation and uuid_attributes" do
      it "is expected that return a kind of Array" do
        expect(subject.cancellation.nodes_uuid).to be_kind_of Nodes::Collection
      end
      
      it "is expected that return a kind of Nodes::Uuid " do
        expect(subject.cancellation.nodes_uuid.all.first).to be_kind_of Nodes::Uuid
      end
    end
  end
end