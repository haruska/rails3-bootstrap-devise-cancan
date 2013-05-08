require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  context "GET 'show'" do

    should "be successful" do
      get :show, :id => @user.id
      assert_response :success
    end

    should "find the right user" do
      get :show, :id => @user.id
      assert_equal @user, assigns(:user)
    end

  end

end
