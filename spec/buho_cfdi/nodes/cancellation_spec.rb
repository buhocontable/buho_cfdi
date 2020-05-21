RSpec.describe Nodes::Cancellation, type: :model do
  it { should respond_to(:date) }
  it { should respond_to(:rfc) }

  context 'required params' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:rfc) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end