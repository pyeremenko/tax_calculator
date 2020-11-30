class BillItem
  attr_reader :title, :amount, :type, :price, :imported, :shelf_price

  def initialize(title: '', amount: 1, type: nil, price: 0, imported: false)
    @title = title
    @amount = amount
    @type = type
    @price = price
    @imported = imported
  end

  def set_shelf_price(tax: 0)
    @shelf_price = (total_price + tax).round(2)
  end

  def total_price
    amount * price
  end
end
