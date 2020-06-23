RSpec.describe Nodes::PayrollIssuer, type: :model do
  it { should respond_to(:curp) }
  it { should respond_to(:employer_registration) }
  it { should respond_to(:rfc_origin_employer) }

  context 'required params' do
    it { should validate_presence_of(:employer_registration) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end