require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :title => "MyString",
      :desc => "MyText"
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", events_path, "post" do
      assert_select "input#event_title[name=?]", "event[title]"
      assert_select "textarea#event_desc[name=?]", "event[desc]"
    end
  end
end
