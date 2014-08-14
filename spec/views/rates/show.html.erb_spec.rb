require 'spec_helper'

describe "rates/show" do
  before(:each) do
    @rate = assign(:rate, stub_model(Rate,
      :package => "Package",
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Package/)
    rendered.should match(/9.99/)
  end
end
