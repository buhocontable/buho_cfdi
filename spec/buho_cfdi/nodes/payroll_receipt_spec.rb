RSpec.describe Nodes::PayrollReceipt, type: :model do
  it { should respond_to(:version) }
  it { should respond_to(:serie) }
  it { should respond_to(:folio_number) }
  it { should respond_to(:date) }
  it { should respond_to(:stamp) }
  it { should respond_to(:payment_way) }
  it { should respond_to(:certificate_number) }
  it { should respond_to(:certificate) }
  it { should respond_to(:subtotal) }
  it { should respond_to(:discount) }
  it { should respond_to(:currency) }
  it { should respond_to(:total) }
  it { should respond_to(:type_of_receipt) }
  it { should respond_to(:payment_method) }
  it { should respond_to(:expedition_place) }
  it { should respond_to(:confirmation) }

  context 'required params' do
    it { should validate_presence_of(:version) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:stamp) }
    it { should validate_presence_of(:certificate_number) }
    it { should validate_presence_of(:certificate) }
    it { should validate_presence_of(:subtotal) }
    it { should validate_presence_of(:currency) }
    it { should validate_presence_of(:total) }
    it { should validate_presence_of(:type_of_receipt) }
    it { should validate_presence_of(:expedition_place) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end