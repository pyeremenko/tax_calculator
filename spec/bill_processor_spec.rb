require_relative '../bill_processor'

describe BillProcessor do
  let(:shelf_prices) { subject[:items].map{|i| i.shelf_price} }

  # TODO: shared examples
  context 'first test case from specification' do
    let(:bill_lines) { ['2 book at 12.49', '1 music CD at 14.99', '1 chocolate bar at 0.85'] }
    let(:subject) { BillProcessor.new(*bill_lines).process }

    it 'calculates right tax and total' do
      is_expected.to include(total: 42.32, taxes: 1.50)
    end

    it 'calculates shelf prices' do
      expect(shelf_prices).to contain_exactly(24.98, 16.49, 0.85)
    end
  end

  context 'second test case from specification' do
    let(:bill_lines) {
      [
        '1 imported box of chocolates at 10.00',
        '1 imported bottle of perfume at 47.50'
      ]
    }
    let(:subject) { BillProcessor.new(*bill_lines).process }

    it 'calculates right tax and total' do
      is_expected.to include(total: 65.15, taxes: 7.65)
    end

    it 'calculates shelf prices' do
      expect(shelf_prices).to contain_exactly(10.5, 54.65)
    end
  end

  context 'second test case from specification' do
    let(:bill_lines) {
      [
        '1 imported bottle of perfume at 27.99',
        '1 bottle of perfume at 18.99',
        '1 packet of headache pills at 9.75',
        '3 imported boxes of chocolates at 11.25'
      ]
    }
    let(:subject) { BillProcessor.new(*bill_lines).process }

    it 'calculates right tax and total' do
      is_expected.to include(total: 98.38, taxes: 7.90)
    end

    it 'calculates shelf prices' do
      expect(shelf_prices).to contain_exactly(32.19, 20.89, 35.55, 9.75)
    end
  end
end
