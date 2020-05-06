RSpec.describe Nodes::Part, type: :model do
  it { should respond_to(:prod_or_svc_key) }
  it { should respond_to(:identification_number) }
  it { should respond_to(:quantity) }
  it { should respond_to(:unit_measure) }
  it { should respond_to(:description) }
  it { should respond_to(:unit_value) }
  it { should respond_to(:amount) }

  context 'required params' do
    it { should validate_presence_of(:prod_or_svc_key) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:description) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end