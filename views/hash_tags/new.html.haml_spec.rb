require 'spec_helper'

describe "hash_tags/new" do
  before(:each) do
    assign(:hash_tag, stub_model(HashTag,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new hash_tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", hash_tags_path, "post" do
      assert_select "input#hash_tag_name[name=?]", "hash_tag[name]"
    end
  end
end
