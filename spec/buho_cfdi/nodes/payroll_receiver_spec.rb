RSpec.describe Nodes::PayrollReceiver, type: :model do
  it { should respond_to(:curp) }
  it { should respond_to(:imss) }
  it { should respond_to(:start_date_employment_relationship) }
  it { should respond_to(:antiquity) }
  it { should respond_to(:contract_type) }
  it { should respond_to(:unionized) }
  it { should respond_to(:workday_shift) }
  it { should respond_to(:regime_type) }
  it { should respond_to(:employee_number) }
  it { should respond_to(:department) }
  it { should respond_to(:job) }
  it { should respond_to(:risk_class) }
  it { should respond_to(:payment_frequency) }
  it { should respond_to(:bank) }
  it { should respond_to(:bank_account) }
  it { should respond_to(:base_salary_contribution) }
  it { should respond_to(:integrated_daily_wage) }
  it { should respond_to(:federal_entity_key) }

  context 'required params' do
    it { should validate_presence_of(:curp) }
    it { should validate_presence_of(:imss) }
    it { should validate_presence_of(:start_date_employment_relationship) }
    it { should validate_presence_of(:antiquity) }
    it { should validate_presence_of(:contract_type) }
    it { should validate_presence_of(:unionized) }
    it { should validate_presence_of(:workday_shift) }
    it { should validate_presence_of(:regime_type) }
    it { should validate_presence_of(:employee_number) }
    it { should validate_presence_of(:job) }
    it { should validate_presence_of(:risk_class) }
    it { should validate_presence_of(:payment_frequency) }
    it { should validate_presence_of(:base_salary_contribution) }
    it { should validate_presence_of(:integrated_daily_wage) }
    it { should validate_presence_of(:federal_entity_key) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end