RSpec.describe BuhoCfdi::PayrollBuilder do
  it { should respond_to(:params) }
  it { should respond_to(:payroll_receipt) }

  let :params do 
    payroll_params
  end

  subject{ BuhoCfdi::PayrollBuilder.new(params) }

  describe "#params" do
    it "is expected that return a kind of Hash" do
      expect(subject.params).to be_kind_of Hash
    end
  end

  describe "#build_payroll" do
    context "with valid params" do
      it "is expected that return a kind of Nodes::PayrollReceipt" do
        expect(subject.build_payroll).to be_kind_of Nodes::PayrollReceipt
      end
    end
  end
end