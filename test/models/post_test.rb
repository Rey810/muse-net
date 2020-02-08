require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:radiohead)
    @post = @user.posts.create(content: "Lorem ipsum")
  end

  test "user post belongs to user" do
    assert @post.user, @user
  end

  test "post contains content" do
    assert @post.content, "Lorem ipsum"
  end

  test "user owns another post after it is created" do
    assert_difference '@user.posts.count', 1 do
      @user.posts.create(content: "Lorem ipsum")
    end
  end
end
