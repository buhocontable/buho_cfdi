RSpec.describe Nodes::Deductions, type: :model do
  it { should respond_to(:total_other_deductions) }
  it { should respond_to(:total_taxes_detained) }

  context 'required params' do
    it { should validate_presence_of(:total_other_deductions) }
    it { should validate_presence_of(:total_taxes_detained) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end