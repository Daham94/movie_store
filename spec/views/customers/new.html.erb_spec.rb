require 'rails_helper'

RSpec.describe "customers/new", type: :view do
  before(:each) do
    assign(:customer, Customer.new(
      name: "MyString",
      email: "MyString",
      password_digest: "MyString"
    ))
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      assert_select "input[name=?]", "customer[name]"

      assert_select "input[name=?]", "customer[email]"

      assert_select "input[name=?]", "customer[password_digest]"
    end
  end
end
