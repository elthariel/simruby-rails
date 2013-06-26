require 'spec_helper'

describe Api::ProfilesController do
  # KEEP CALM this tests work on a >> RESTFULL API <<
  # All render must be in json !

  # A test content for a new User (just to keep DRY)
  let(:valid_attributes_user) { { "email" => "test@example.com",
                                  "username" => "test",
                                  "password" => "qweasd",
                                  "password_confirmation" => "qweasd" } }

  describe 'GET show profile' do
    it 'Test on known id' do
      user = User.create! valid_attributes_user
      profile = user.profile
      get :show, {id: user.id}
      assigns(:profile).should eq(profile)
    end

    it 'Test on unknown id' do
      get :show, {id:  999999} # 9999999 just to show it's not supposed to exist :-)
      assigns(:profile).should be_nil
    end
  end

  describe 'GET profile followers' do
    it 'Test on followers list' do
      user = User.create! valid_attributes_user
      user.follower_links.create(follower_id: 1)
      profile = user.profile
      get :followers, {profile_id: profile.id}
      assigns(:followers).should eq(user.followers)
    end

    it 'Test on followers list with not unknown id' do
      get :followers, {profile_id: 999999} # 9999999 just to show it's not supposed to exist :-)
      assigns(:followers).should be_nil
    end
  end

  describe 'GET profile followees' do
    it 'Test on followees list' do
      user = User.create! valid_attributes_user
      user.followee_links.create(followee_id: 1)
      profile = user.profile
      get :followees, {profile_id: profile.id}
      assigns(:followees).should eq(user.followees)
    end

    it 'Test on followees list with not unknown id' do
      get :followees, {profile_id: 999999} # 9999999 just to show it's not supposed to exist :-)
      assigns(:followees).should be_nil
    end
  end



end
