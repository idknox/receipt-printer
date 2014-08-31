require "spec_helper"

describe "Receipt Printer" do
  it "returns its line items" do
    receipt = [
      {name: "book", category: "book", amount: 12.49},
      {name: "CD", category: "music", amount: 14.99},
      {name: "chocolate", category: "food", amount: 0.85},
    ]

    formatted_receipt = ReceiptPrinter.new(receipt)
    expect(formatted_receipt.line_items).to eq(receipt)
  end

  it "computes sales tax" do
    receipt = [
      {name: "book", category: "book", amount: 12.49},
      {name: "CD", category: "music", amount: 14.99},
      {name: "chocolate", category: "food", amount: 0.85},
    ]

    expected_output = [
      {name: "book", amount: 12.49},
      {name: "CD", amount: 16.49},
      {name: "chocolate", amount: 0.85},
      {name: "sales tax", amount: 1.50}
    ]

    formatted_receipt = ReceiptPrinter.new(receipt).with_tax(10)
    expect(formatted_receipt).to eq(expected_output)
  end
end
