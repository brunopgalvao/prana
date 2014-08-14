require 'spec_helper'

describe "rates/new" do
  before(:each) do
    assign(:rate, stub_model(Rate,
      :package => "MyString",
      :price => "9.99"
    ).as_new_record)
  end

  it "renders new rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rates_path, "post" do
      assert_select "input#rate_package[name=?]", "rate[package]"
      assert_select "input#rate_price[name=?]", "rate[price]"
    end
  end
end
