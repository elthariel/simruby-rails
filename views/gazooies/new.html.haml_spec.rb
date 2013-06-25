require 'spec_helper'

describe "gazooies/new" do
  before(:each) do
    assign(:gazooy, stub_model(Gazooy,
      :user_id => 1,
      :text => "MyString",
      :reply_to_id => 1
    ).as_new_record)
  end

  it "renders new gazooy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", gazooies_path, "post" do
      assert_select "input#gazooy_user_id[name=?]", "gazooy[user_id]"
      assert_select "input#gazooy_text[name=?]", "gazooy[text]"
      assert_select "input#gazooy_reply_to_id[name=?]", "gazooy[reply_to_id]"
    end
  end
end
