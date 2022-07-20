RSpec.describe ::Nodes::Transferred, type: :model do
  context 'when factor_type is not Exento' do
    let (:node) { ::Nodes::Transferred.new({tax: '001', factor_type: 'Tasa', base: '100', rate_or_fee: '0.1000', import: '100'}) }
    it 'has all values' do
      expect(node).to be_valid
      expect(node.tax).to eq('001')
      expect(node.factor_type).to eq('Tasa')
      expect(node.base).to eq('100')
      expect(node.rate_or_fee).to eq('0.1000')
      expect(node.import).to eq('100')
      expect(node.to_hash).to eq({"Impuesto"=>"001", "TipoFactor"=>"Tasa", "Base"=>"100", "TasaOCuota"=>"0.1000", "Importe"=>"100"})
    end
  end

  context 'when factor_type is Exento' do
    let (:node) { ::Nodes::Transferred.new({tax: '001', factor_type: 'Exento', base: '100'}) }
    it 'has only required values' do
      expect(node).to be_valid
      expect(node.tax).to eq('001')
      expect(node.factor_type).to eq('Exento')
      expect(node.base).to eq('100')
      expect(node.rate_or_fee).to be_nil
      expect(node.import).to be_nil
      expect(node.to_hash).to eq({"Impuesto"=>"001", "TipoFactor"=>"Exento", "Base"=>"100"})
    end
  end
end