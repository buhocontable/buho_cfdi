RSpec.describe Nodes::PayrollExtraHours, type: :model do
  it { should respond_to(:days) }
  it { should respond_to(:hours_type) }
  it { should respond_to(:extra_hour) }
  it { should respond_to(:amount_paid) }

  context 'required params' do
    it { should validate_presence_of(:days) }
    it { should validate_presence_of(:hours_type) }
    it { should validate_presence_of(:extra_hour) }
    it { should validate_presence_of(:amount_paid) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end