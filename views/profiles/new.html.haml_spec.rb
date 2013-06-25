require 'spec_helper'

describe "profiles/new" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :avatar => "MyString",
      :background => "MyString",
      :user_id => 1,
      :name => "MyString",
      :place => "MyString",
      :website => "MyString",
      :bio => "MyString"
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profiles_path, "post" do
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
