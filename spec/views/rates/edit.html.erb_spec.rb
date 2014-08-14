require 'spec_helper'

describe "rates/edit" do
  before(:each) do
    @rate = assign(:rate, stub_model(Rate,
      :package => "MyString",
      :price => "9.99"
    ))
  end

  it "renders the edit rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rate_path(@rate), "post" do
      assert_select "input#rate_package[name=?]", "rate[package]"
      assert_select "input#rate_price[name=?]", "rate[price]"
    end
  end
end
