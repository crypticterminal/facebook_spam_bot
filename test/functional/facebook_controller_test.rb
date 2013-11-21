require 'test_helper'

class FacebookControllerTest < ActionController::TestCase
  test "should get search_people" do
    get :search_people
    assert_response :success
  end

end
