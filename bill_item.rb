class BillItem
  attr_accessor :title, :amount, :type, :price, :imported

  def initialize(title: '', amount: 1, type: nil, price: 0, imported: false)
    @title = title
    @amount = amount
    @type = type
    @price = price
    @imported = imported
  end
end
