require 'rails_helper'

RSpec.describe "inventories/show", type: :view do
  before(:each) do
    @inventory = assign(:inventory, Inventory.create!(
      price: 2.5,
      total_copies: 3,
      barcode_no: "Barcode No"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Barcode No/)
  end
end
