require 'spec_helper'

describe Api::UserGazooiesController do
  # KEEP CALM this tests work on a >> RESTFULL API <<
  # All render must be in json !
  # help for that route : /api/users/:user_id/gazooies
  # note that : /api/users/index / show / edit etc. must not exist !

  # A test content for a gazooy (just to keep DRY)
  let(:valid_attributes_gazooies) { { "user_id" => "1", "text" => "#some #test #tags #in #a #gazooy"} }


  # A test content for a new User (just to keep DRY)
  let(:valid_attributes_user) { { "email" => "test@example.com",
                                  "username" => "test",
                                  "password" => "qweasd",
                                  "password_confirmation" => "qweasd" } }


  describe 'GET Users Gazooies list' do
    it 'Test on api_user_gazooies#index' do
      user = User.create! valid_attributes_user
      gazooy = Gazooy.create! valid_attributes_gazooies
      get :index, {user_id: user.id}
      assigns(:gazooies).should eq([gazooy])
    end
  end
end
