require 'spec_helper'

describe "profiles/index" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :avatar => "Avatar",
        :background => "Background",
        :user_id => 1,
        :name => "Name",
        :place => "Place",
        :website => "Website",
        :bio => "Bio"
      ),
      stub_model(Profile,
        :avatar => "Avatar",
        :background => "Background",
        :user_id => 1,
        :name => "Name",
        :place => "Place",
        :website => "Website",
        :bio => "Bio"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => "Background".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Place".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Bio".to_s, :count => 2
  end
end
