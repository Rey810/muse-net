require 'test_helper'

class FriendshipRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get friendship_requests_create_url
    assert_response :success
  end

  test "should get destroy" do
    get friendship_requests_destroy_url
    assert_response :success
  end

end
