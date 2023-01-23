require "test_helper"

class FollowersControllerTest < ActionDispatch::IntegrationTest
  test "should get :index" do
    get followers_:index_url
    assert_response :success
  end
end
