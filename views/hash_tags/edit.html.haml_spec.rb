require 'spec_helper'

describe "hash_tags/edit" do
  before(:each) do
    @hash_tag = assign(:hash_tag, stub_model(HashTag,
      :name => "MyString"
    ))
  end

  it "renders the edit hash_tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", hash_tag_path(@hash_tag), "post" do
      assert_select "input#hash_tag_name[name=?]", "hash_tag[name]"
    end
  end
end
