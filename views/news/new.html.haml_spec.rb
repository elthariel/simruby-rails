require 'spec_helper'

describe "news/new" do
  before(:each) do
    assign(:news, stub_model(News,
      :title => "MyString",
      :summary => "MyText",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new news form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", news_index_path, "post" do
      assert_select "input#news_title[name=?]", "news[title]"
      assert_select "textarea#news_summary[name=?]", "news[summary]"
      assert_select "textarea#news_content[name=?]", "news[content]"
    end
  end
end
