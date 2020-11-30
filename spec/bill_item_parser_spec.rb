require_relative '../bill_item_parser'

describe BillItemParser do
  SIMPLE_IMPORTED_INPUT = '3 imported boxes of chocolates at 11.25'.freeze
  SIMPLE_INPUT = '3 boxes of chocolates at 11.25'.freeze

  describe '#parse' do
    it 'parses amount of goods in a line' do
      expect(BillItemParser.parse(SIMPLE_INPUT)).to have_attributes(amount: 3)
    end

    it 'parses title of a line' do
      expect(BillItemParser.parse(SIMPLE_INPUT)).to have_attributes(title: 'boxes of chocolates')
    end

    it 'parses price of a good' do
      expect(BillItemParser.parse(SIMPLE_INPUT)).to have_attributes(price: 11.25)
    end

    it 'parses imported flag of a line' do
      expect(BillItemParser.parse(SIMPLE_INPUT)).to have_attributes(imported: false)
      expect(BillItemParser.parse(SIMPLE_IMPORTED_INPUT)).to have_attributes(imported: true)
    end
  end
end