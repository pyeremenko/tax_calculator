require_relative 'item_classifier'

class DummyItemClassifier < ItemClassifier
  BOOK_KEYWORDS = {type: :book, keywords: %w[book].freeze}
  MEDICAL_PRODUCT_KEYWORDS = {type: :medical_product, keywords: %w[medical pills].freeze}
  FOOD_KEYWORDS = {type: :food, keywords: %w[food chocolate].freeze}

  def classify(title)
    [BOOK_KEYWORDS, MEDICAL_PRODUCT_KEYWORDS, FOOD_KEYWORDS].each do |group|
      group[:keywords].each do |k|
        return group[:type] if title.include? k
      end
    end
    :other
  end
end