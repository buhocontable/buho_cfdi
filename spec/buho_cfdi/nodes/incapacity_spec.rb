RSpec.describe Nodes::Incapacity, type: :model do
  it { should respond_to(:days_disability) }
  it { should respond_to(:incapacity_type) }
  it { should respond_to(:monetary_amount) }

  context 'required params' do
    it { should validate_presence_of(:days_disability) }
    it { should validate_presence_of(:incapacity_type) }
    it { should validate_presence_of(:monetary_amount) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end