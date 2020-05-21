RSpec.describe Nodes::Issuer, type: :model do
  it { should respond_to(:rfc) }
  it { should respond_to(:name) }
  it { should respond_to(:fiscal_regime) }

  context 'required params' do
    it { should validate_presence_of(:rfc) }
    it { should validate_presence_of(:fiscal_regime) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end