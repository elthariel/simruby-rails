require "spec_helper"

describe CommentsController do
  describe "routing" do

    it "NO routes to #index" do
      get("/comments").should_not route_to("comments#index")
    end

    it "NO routes to #new" do
      get("/comments/new").should_not be_routable
    end

    it "NO routes to #show" do
      get("/comments/1").should_not be_routable
    end

    it "NO routes to #edit" do
      get("/comments/1/edit").should_not be_routable
    end

    it "routes to #create" do
      post("/comments").should route_to("comments#create")
    end

    it "NO routes to #update" do
      put("/comments/1").should_not be_routable
    end

    it "NO routes to #destroy" do
      delete("/comments/1").should_not be_routable
    end

  end
end
