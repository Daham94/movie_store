require 'rails_helper'

RSpec.describe "inventories/new", type: :view do
  before(:each) do
    assign(:inventory, Inventory.new(
      price: 1.5,
      total_copies: 1,
      barcode_no: "MyString"
    ))
  end

  it "renders new inventory form" do
    render

    assert_select "form[action=?][method=?]", inventories_path, "post" do

      assert_select "input[name=?]", "inventory[price]"

      assert_select "input[name=?]", "inventory[total_copies]"

      assert_select "input[name=?]", "inventory[barcode_no]"
    end
  end
end
