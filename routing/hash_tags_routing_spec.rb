require "spec_helper"

describe HashTagsController do
  describe "routing" do

    it "routes to #index" do
      get("/hash_tags").should route_to("hash_tags#index")
    end

    it "routes to #new" do
      get("/hash_tags/new").should route_to("hash_tags#new")
    end

    it "routes to #show" do
      get("/hash_tags/1").should route_to("hash_tags#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hash_tags/1/edit").should route_to("hash_tags#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hash_tags").should route_to("hash_tags#create")
    end

    it "routes to #update" do
      put("/hash_tags/1").should route_to("hash_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hash_tags/1").should route_to("hash_tags#destroy", :id => "1")
    end

  end
end
