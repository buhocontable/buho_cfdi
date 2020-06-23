RSpec.describe Nodes::Payroll, type: :model do
  it { should respond_to(:version) }
  it { should respond_to(:payroll_type) }
  it { should respond_to(:payment_date) }
  it { should respond_to(:payment_start_date) }
  it { should respond_to(:payment_end_date) }
  it { should respond_to(:number_days_paid) }
  it { should respond_to(:total_perceptions) }
  it { should respond_to(:total_deductions) }
  it { should respond_to(:total_other_payments) }

  context 'required params' do
    it { should validate_presence_of(:version) }
    it { should validate_presence_of(:payroll_type) }
    it { should validate_presence_of(:payment_date) }
    it { should validate_presence_of(:payment_start_date) }
    it { should validate_presence_of(:payment_end_date) }
    it { should validate_presence_of(:number_days_paid) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end