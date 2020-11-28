require_relative '../dummy_item_classifier'

describe DummyItemClassifier do
  let(:classifier) { described_class.new }

  describe '#classify' do
    it 'classifies box of chocolates as food' do
      expect(classifier.classify('box of chocolates')).to eq :food
    end

    it 'classifies chocolate bar as food' do
      expect(classifier.classify('chocolate bar')).to eq :food
    end

    it 'classifies headache pills as meds' do
      expect(classifier.classify('headache pills')).to eq :medical_product
    end

    it 'classifies adventure books as books' do
      expect(classifier.classify('adventure books')).to eq :book
    end

    it 'classifies bottle of perfume as other' do
      expect(classifier.classify('bottle of perfume')).to eq :other
    end

    it 'classifies music CD as other' do
      expect(classifier.classify('music CD')).to eq :other
    end
  end
end