require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  def setup
    @user = users(:radiohead)
    @friend = users(:coldplay)
    @friendship = friendships(:one)
  end

  test "user should be able to add a friend" do
    assert_difference '@user.friends.count', 1 do 
      @user.friendships.create(friend_id: @friend.id)
    end
  end

  test "user can't create friends/users" do
    assert_no_difference 'User.all.count' do
      @user.friends.create(name: 'Kendrick Lamar')
    end
  end
  
end
