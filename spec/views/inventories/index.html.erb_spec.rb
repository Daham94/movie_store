require 'rails_helper'

RSpec.describe "inventories/index", type: :view do
  before(:each) do
    assign(:inventories, [
      Inventory.create!(
        price: 2.5,
        total_copies: 3,
        barcode_no: "Barcode No"
      ),
      Inventory.create!(
        price: 2.5,
        total_copies: 3,
        barcode_no: "Barcode No"
      )
    ])
  end

  it "renders a list of inventories" do
    render
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Barcode No".to_s, count: 2
  end
end
