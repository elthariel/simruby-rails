require 'spec_helper'

describe "hash_tags/show" do
  before(:each) do
    @hash_tag = assign(:hash_tag, stub_model(HashTag,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
