RSpec.describe Nodes::OtherPayment, type: :model do
  it { should respond_to(:other_payment_type) }
  it { should respond_to(:other_payment_key) }
  it { should respond_to(:concept) }
  it { should respond_to(:amount) }

  context 'required params' do
    it { should validate_presence_of(:other_payment_type) }
    it { should validate_presence_of(:other_payment_key) }
    it { should validate_presence_of(:concept) }
    it { should validate_presence_of(:amount) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end