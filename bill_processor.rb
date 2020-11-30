require_relative 'bill_item'
require_relative 'bill_item_tax_calculator'
require_relative 'bill_item_parser'

class BillProcessor
  attr_reader :lines

  def initialize(*lines)
    @lines = lines
  end

  def process
    total = 0
    taxes = 0
    bill_items = []

    lines.each do |line|
      bill_item = BillItemParser.parse(line)
      # TODO: probably it would be better to calculate the tax inside BillItem model
      tax = BillItemTaxCalculator.new(bill_item).calculate
      bill_item.set_shelf_price(tax: tax)
      bill_items << bill_item

      total += bill_item.price * bill_item.amount + tax
      taxes += tax
    end

    {
        total: total,
        taxes: taxes,
        items: bill_items
    }
  end
end