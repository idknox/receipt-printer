class ReceiptPrinter
  def initialize(line_items)
    @line_items = line_items
  end

  attr_accessor :line_items

  def with_tax(tax_rate)
    output = []
    tax_total = 0
    @line_items.each do |line_item|
      if line_item[:category] != "food" && line_item[:category] != "book" && line_item[:category] != "medical"
        tax_percentage = tax_rate.to_f/100
        tax_amount = line_item[:amount] * tax_percentage
        amount_with_tax = line_item[:amount] + tax_amount
      output.push(
          {
            name: "#{line_item[:name]}",
            amount: amount_with_tax.round(2)
          }
        )
        tax_total += tax_amount
      else
        output.push(
          {
            name: "#{line_item[:name]}",
            amount: line_item[:amount]
          }
        )
      end
    end
    output.push(
      {name: "sales tax", amount: tax_total.round(2)}
    )
    output
  end
end