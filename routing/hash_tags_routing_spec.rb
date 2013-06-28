require "spec_helper"

describe HashTagsController do
  describe "routing" do

    it "NO routes to #index" do
      get("/hash_tags").should_not route_to("hash_tags#index")
    end

    it "NO routes to #new" do
      get("/hash_tags/new").should_not route_to("hash_tags#new")
    end

    it "routes to #show" do
      get("/hash_tags/1").should route_to("hash_tags#show", :id => "1")
    end

    it "NO routes to #edit" do
      get("/hash_tags/1/edit").should_not be_routable
    end

    it "NO routes to #create" do
      post("/hash_tags").should_not route_to("hash_tags#create")
    end

    it "NO routes to #update" do
      put("/hash_tags/1").should_not be_routable
    end

    it "routes to #destroy" do
      delete("/hash_tags/1").should_not be_routable
    end

  end
end
