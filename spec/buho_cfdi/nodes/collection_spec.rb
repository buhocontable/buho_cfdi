RSpec.describe Nodes::Collection do
  subject { Nodes::Collection.new(Nodes::Receipt) }

  it { should respond_to(:_collection) }
  it { should respond_to(:klass) }

  describe '#add' do
    it 'is expected to return a kind of Hash' do
      expect(subject.add(version: '3.3')).to be_kind_of(Nodes::Receipt)
    end

    before do
      subject.add(version: '3.3')
    end

    it 'is expected that #_collection size eql? to 1' do
      expect(subject._collection.size).to eql(1)
    end
  end

  describe '#_collection' do
    it 'is expected that #_collection kind of Array' do
      expect(subject._collection).to be_kind_of(Array)
    end

    before do
      3.times do
        subject.add(version: '3.3')
      end
    end

    it 'is expected that #_collection size eql? to 1' do
      expect(subject._collection.size).to eql(3)
    end

    it 'is expected that each object in #_collection kind of Nodes::Receipt' do
      subject._collection.each do |instance|
        expect(instance).to be_kind_of(Nodes::Receipt)
      end
    end
  end

  describe '#klass' do
    it 'is expected that return a kind of Nodes::Receipt' do
      expect(subject.klass).to be(Nodes::Receipt)
    end
  end

  describe '#all' do
    it 'is expected that #_collection kind of Array' do
      expect(subject._collection).to be_kind_of(Array)
    end
  end
end