require 'spec_helper'

describe "gazooies/show" do
  before(:each) do
    @gazooy = assign(:gazooy, stub_model(Gazooy,
      :user_id => 1,
      :text => "Text",
      :reply_to_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Text/)
    rendered.should match(/2/)
  end
end
