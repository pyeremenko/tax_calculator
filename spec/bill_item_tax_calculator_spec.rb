require_relative '../bill_item_tax_calculator'
require_relative '../bill_item'

describe BillItemTaxCalculator do
  let(:base_bill_item_params) { { title: 'test', amount: 1, type: :other, price: 12.99, imported: false } }
  let(:bill_item_params) { base_bill_item_params }
  let(:bill_item) { BillItem.new(bill_item_params) }

  describe '#calculate' do
    let(:subject) { BillItemTaxCalculator.new(bill_item).calculate }

    context 'when an item is imported' do
      context 'when an item is a book' do
        let(:bill_item_params) { base_bill_item_params.merge(imported: true, type: :book) }

        it { is_expected.to eq 0.65 }
      end

      context 'when an item is food' do
        let(:bill_item_params) { base_bill_item_params.merge(imported: true, type: :food)}

        it { is_expected.to eq 0.65 }
      end

      context 'when an item is a medical product' do
        let(:bill_item_params) { base_bill_item_params.merge(imported: true, type: :medical_product) }

        it { is_expected.to eq 0.65 }
      end

      context 'when an item is not free of sales tax' do
        let(:bill_item_params) { base_bill_item_params.merge(imported: true, type: :other) }

        it { is_expected.to eq(0.65 + 1.3) }
      end
    end

    context 'when an item is not imported' do
      context 'when an item is a book' do
        let(:bill_item_params) { base_bill_item_params.merge(type: :book) }

        it { is_expected.to be_zero }
      end

      context 'when an item is food' do
        let(:bill_item_params) { base_bill_item_params.merge(type: :food)}

        it { is_expected.to be_zero }
      end

      context 'when an item is a medical product' do
        let(:bill_item_params) { base_bill_item_params.merge(type: :medical_product) }

        it { is_expected.to be_zero }
      end

      context 'when an item is not free of sales tax' do
        let(:bill_item_params) { base_bill_item_params.merge(type: :other) }

        it { is_expected.to eq 1.3 }
      end
    end
  end
end