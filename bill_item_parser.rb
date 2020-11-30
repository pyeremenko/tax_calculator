require_relative 'dummy_item_classifier'

class BillItemParser
  PATTERN = /
    (?<amount>\d+)\s+
    (?<imported>(?:imported\s+)?)
    (?<title>(?:\w+\s+)+)+
    at\s+(?<price>[0-9.]+)\s*$
  /x.freeze

  def self.parse(data)
    match = PATTERN.match(data)
    raise('wrong format') unless match

    BillItem.new(
      amount: match['amount'].to_i,
      title: match['title'].strip,
      imported: match['imported']&.length > 0,
      price: match['price'].to_f,
      type: get_type_by_title(match['title'])
    )
  end

  def self.get_type_by_title(title)
    # TODO: inject
    DummyItemClassifier.new.classify(title)
  end
end
