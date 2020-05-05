RSpec.describe Nodes::Receiver, type: :model do
  it { should respond_to(:rfc) }
  it { should respond_to(:name) }
  it { should respond_to(:tax_residency) }
  it { should respond_to(:tax_identity_registration_number) }
  it { should respond_to(:cfdi_usage) }

  context 'required params' do
    it { should validate_presence_of(:rfc) }
    it { should validate_presence_of(:cfdi_usage) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end