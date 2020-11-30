class BillItemTaxCalculator
  SALES_TAX_EXCLUSIONS = %i[book food medical_product]

  attr_reader :bill_item

  def initialize(bill_item)
    @bill_item = bill_item
  end

  def calculate
    import_duty = bill_item.imported ?  bill_item.amount * round_up_to_05(bill_item.price * 0.05) : 0
    sales_tax = sales_tax_applicable? ? bill_item.amount * round_up_to_05(bill_item.price * 0.1) : 0

    import_duty + sales_tax
  end

  private

  def sales_tax_applicable?
    !SALES_TAX_EXCLUSIONS.include?(bill_item.type)
  end

  def round_up_to_05(number)
    result = (2 * number).round(1) / 2
    result + (result < number ? 0.05 : 0)
  end
end
