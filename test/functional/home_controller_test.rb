require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  context "GET 'index'" do

    should 'be successful' do
      get 'index'
      assert_response :success
    end

  end

end
