require "spec_helper"

describe GazooiesController do
  describe "routing" do

    it "routes to #index" do
      get("/gazooies").should route_to("gazooies#index")
    end

    it "routes to #new" do
      get("/gazooies/new").should route_to("gazooies#new")
    end

    it "routes to #show" do
      get("/gazooies/1").should route_to("gazooies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gazooies/1/edit").should route_to("gazooies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gazooies").should route_to("gazooies#create")
    end

    it "routes to #update" do
      put("/gazooies/1").should route_to("gazooies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gazooies/1").should route_to("gazooies#destroy", :id => "1")
    end

  end
end
