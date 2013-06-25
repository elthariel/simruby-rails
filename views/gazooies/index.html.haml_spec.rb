require 'spec_helper'

describe "gazooies/index" do
  before(:each) do
    assign(:gazooies, [
      stub_model(Gazooy,
        :user_id => 1,
        :text => "Text",
        :reply_to_id => 2
      ),
      stub_model(Gazooy,
        :user_id => 1,
        :text => "Text",
        :reply_to_id => 2
      )
    ])
  end

  it "renders a list of gazooies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
