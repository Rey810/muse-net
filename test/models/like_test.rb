require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup 
    @user = users(:radiohead)
    @post = posts(:post1)
  end

  test "user can like post" do
    assert_difference '@post.likes.count', 1 do
      @post.likes.create(user_id: @user.id)
    end
  end
  
end
