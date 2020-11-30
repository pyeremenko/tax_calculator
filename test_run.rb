require_relative 'bill_processor'

data_file = ARGV.first
exit unless data_file
bill_lines = File.readlines(data_file)

bill = BillProcessor.new(*bill_lines).process

bill[:items].each do |item|
  imported = item.imported ? 'imported ' : ''
  shelf_price = "%0.2f" % item.shelf_price
  puts("#{item.amount} #{imported}#{item.title}: #{shelf_price}")
end
puts("Sales Taxes: %0.2f" % bill[:taxes])
puts("Total: %0.2f" % bill[:total])