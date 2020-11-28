class BillItemTaxCalculator
  SALES_TAX_EXCLUSIONS = %i[book food medical_product]

  attr_reader :bill_item

  def initialize(bill_item)
    @bill_item = bill_item
  end

  def calculate
    import_duty = bill_item.imported ? round_up_to_05(bill_item.price * 0.05) : 0
    sales_tax = sales_tax_applicable? ? round_up_to_05(bill_item.price * 0.1) : 0

    #TODO: round05 for each or for sum?
    import_duty + sales_tax
  end

  private

  def sales_tax_applicable?
    !SALES_TAX_EXCLUSIONS.include?(bill_item.type)
  end

  def round_up_to_05(price)
    (2 * price).round(1) / 2
  end
end
