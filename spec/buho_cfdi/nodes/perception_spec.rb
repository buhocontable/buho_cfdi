RSpec.describe Nodes::Perception, type: :model do
  it { should respond_to(:perception_type) }
  it { should respond_to(:perception_key) }
  it { should respond_to(:concept) }
  it { should respond_to(:amount_taxed) }
  it { should respond_to(:amount_exempt) }

  context 'required params' do
    it { should validate_presence_of(:perception_type) }
    it { should validate_presence_of(:perception_key) }
    it { should validate_presence_of(:concept) }
    it { should validate_presence_of(:amount_taxed) }
    it { should validate_presence_of(:amount_exempt) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end