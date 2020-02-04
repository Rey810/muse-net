require 'test_helper'

class FriendshipRequestTest < ActiveSupport::TestCase
  def setup
    @user = users(:radiohead)
    @to_user = users(:coldplay)
  end

  test "user can send a friend request to correct user" do
    assert_difference '@user.friendship_requests.count', 1 do
      @user.friendship_requests.create(to_user: @to_user)
    end
    assert @user.friendship_requests.first.to_user.name, @to_user.name
  end

  test "user receives friend request from correct user" do
    @user.friendship_requests.create(to_user: @to_user)
    assert FriendshipRequest.where(to_user: @to_user).first.user.name, @user.name
  end

end
