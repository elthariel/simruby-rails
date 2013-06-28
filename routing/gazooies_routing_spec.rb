require "spec_helper"

describe GazooiesController do
  describe "routing" do

    it "routes to #index" do
      get("/gazooies").should route_to("gazooies#index")
    end

    it "NO routes to #new" do
      get("/gazooies/new").should_not route_to("gazooies#new")
    end

    it "routes to #show" do
      get("/gazooies/1").should route_to("gazooies#show", :id => "1")
    end

    it "NO routes to #edit" do
      get("/gazooies/1/edit").should_not be_routable
    end

    it "routes to #create" do
      post("/gazooies").should route_to("gazooies#create")
    end

    it "NO routes to #update" do
      put("/gazooies/1").should_not be_routable
    end

    it "NO routes to #destroy" do
      delete("/gazooies/1").should_not be_routable
    end

  end
end
