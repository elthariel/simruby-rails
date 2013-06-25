require 'spec_helper'

describe "profiles/show" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :avatar => "Avatar",
      :background => "Background",
      :user_id => 1,
      :name => "Name",
      :place => "Place",
      :website => "Website",
      :bio => "Bio"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Avatar/)
    rendered.should match(/Background/)
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Place/)
    rendered.should match(/Website/)
    rendered.should match(/Bio/)
  end
end
