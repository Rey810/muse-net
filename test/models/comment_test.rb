require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:radiohead)
    @post = @user1.posts.create(content: "Lorem ipsum")
    @user2 = users(:coldplay)
    @comment = @post.comments.create(content: "Comment about a stupid post", user_id: @user2.id)
  end

  test "commented post should have a comment" do
    assert_not @comment.nil?
  end

  test "comment should belong to correct user" do
    assert @comment.user, @user2
  end

  #add validation test below 

end
