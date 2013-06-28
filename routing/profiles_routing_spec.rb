require "spec_helper"

describe ProfilesController do
  describe "routing" do

    it "NO routes to #index" do
      get("/profiles").should_not route_to("profiles#index")
    end

    it "NO routes to #new" do
      get("/profiles/new").should_not route_to("profiles#new")
    end

    it "routes to #show" do
      get("/profiles/1").should route_to("profiles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/profiles/1/edit").should route_to("profiles#edit", :id => "1")
    end

    it "NO routes to #create" do
      post("/profiles").should_not route_to("profiles#create")
    end

    it "routes to #update" do
      put("/profiles/1").should route_to("profiles#update", :id => "1")
    end

    it "NO routes to #destroy" do
      delete("/profiles/1").should_not be_routable
    end

    it 'routes to #follow' do
      post('profiles/1/follow/2').should route_to('profiles#follow', profile_id: '1', user_id: '2')
    end

    it 'routes to #unfollow' do
      delete('profiles/1/unfollow/2').should route_to('profiles#unfollow', profile_id: '1', user_id: '2')
    end

    it 'routes to #followers' do
      get('profiles/1/followers').should route_to('profiles#followers', profile_id: '1')
    end

    it 'routes to #followees' do
      get('profiles/1/followees').should route_to('profiles#followees', profile_id: '1')
    end

    it 'routes to #mentions' do
      get('profiles/1/mentions').should route_to('profiles#mentions', profile_id: '1')
    end

  end
end
