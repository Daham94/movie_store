require 'rails_helper'

RSpec.describe "inventories/edit", type: :view do
  before(:each) do
    @inventory = assign(:inventory, Inventory.create!(
      price: 1.5,
      total_copies: 1,
      barcode_no: "MyString"
    ))
  end

  it "renders the edit inventory form" do
    render

    assert_select "form[action=?][method=?]", inventory_path(@inventory), "post" do

      assert_select "input[name=?]", "inventory[price]"

      assert_select "input[name=?]", "inventory[total_copies]"

      assert_select "input[name=?]", "inventory[barcode_no]"
    end
  end
end
