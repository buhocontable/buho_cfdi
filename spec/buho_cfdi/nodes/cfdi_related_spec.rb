RSpec.describe Nodes::CfdiRelated, type: :model do
  it { should respond_to(:relationship_type) }

  context 'required params' do
    it { should validate_presence_of(:relationship_type) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end