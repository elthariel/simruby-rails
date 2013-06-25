require 'spec_helper'

describe "hash_tags/index" do
  before(:each) do
    assign(:hash_tags, [
      stub_model(HashTag,
        :name => "Name"
      ),
      stub_model(HashTag,
        :name => "Name"
      )
    ])
  end

  it "renders a list of hash_tags" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
