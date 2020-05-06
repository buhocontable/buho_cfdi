RSpec.describe Nodes::Transferred, type: :model do
  it { should respond_to(:tax) }
  it { should respond_to(:factor_type) }
  it { should respond_to(:rate_or_fee) }
  it { should respond_to(:import) }

  context 'required params' do
    it { should validate_presence_of(:tax) }
    it { should validate_presence_of(:factor_type) }
    it { should validate_presence_of(:rate_or_fee) }
    it { should validate_presence_of(:import) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end