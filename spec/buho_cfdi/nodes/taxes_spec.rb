RSpec.describe Nodes::Taxes, type: :model do
  it { should respond_to(:total_taxes_transferred) }
  it { should respond_to(:total_taxes_detained) }

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end