require 'spec_helper'

describe Api::HashTagsController do
  # KEEP CALM this tests work on a >> RESTFULL API <<
  # All render must be in json !

  # A test content for a gazooy (just to keep DRY)
  let(:valid_attributes_gazooies) { { "user_id" => "1", "text" => "#some #test #tags #in #a #gazooy"} }

  let(:valid_attributes_hastag) { { "name" => "MyString" } }

  describe "GET index" do
    it "assigns all hash_tags as @hash_tags" do
      gazooy = Gazooy.create! valid_attributes_gazooies
      all_hashtag = HashTag.all
      get :index, {}
      assigns(:hash_tags).should eq(all_hashtag)
    end
  end

  describe "GET show" do
    it "assigns the requested hash_tag as @hash_tag" do
      gazooy = Gazooy.create! valid_attributes_gazooies
      hash_tag = HashTag.last
      get :show, {:id => hash_tag.name}
      hash_tag = hash_tag.gazooies.limit(50).load
      assigns(:gazooies).should eq(hash_tag)
    end
  end

end