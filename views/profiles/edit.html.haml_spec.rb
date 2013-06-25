require 'spec_helper'

describe "profiles/edit" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :avatar => "MyString",
      :background => "MyString",
      :user_id => 1,
      :name => "MyString",
      :place => "MyString",
      :website => "MyString",
      :bio => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do
      assert_select "input#profile_avatar[name=?]", "profile[avatar]"
      assert_select "input#profile_background[name=?]", "profile[background]"
      assert_select "input#profile_user_id[name=?]", "profile[user_id]"
      assert_select "input#profile_name[name=?]", "profile[name]"
      assert_select "input#profile_place[name=?]", "profile[place]"
      assert_select "input#profile_website[name=?]", "profile[website]"
      assert_select "input#profile_bio[name=?]", "profile[bio]"
    end
  end
end
