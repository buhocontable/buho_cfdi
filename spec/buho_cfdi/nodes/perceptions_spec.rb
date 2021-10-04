RSpec.describe Nodes::Perceptions, type: :model do
  it { should respond_to(:total_salaries) }
  it { should respond_to(:total_separation_compensation) }
  it { should respond_to(:total_retirement_pension) }
  it { should respond_to(:total_taxed) }
  it { should respond_to(:total_exempt) }

  context 'required params' do
    it { should validate_presence_of(:total_salaries) }
    it { should validate_presence_of(:total_taxed) }
    it { should validate_presence_of(:total_exempt) }
  end

  describe '#to_hash' do
    it 'is expected to return a kind of Hash' do
      expect(subject.to_hash).to be_kind_of(Hash)
    end
  end
end