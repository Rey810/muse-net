require 'test_helper'

class FriendRequestFlowTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
    def setup
      @coldplay = users(:coldplay)
    end

    test 'user should login, send a friend request, and sign out' do
      sign_in users(:radiohead)
      get root_path
      assert_template 'static_pages/home'
      assert_select 'div.signed_in_as', text: 'Signed in as Radiohead. Not you?'
      get users_path
      assert_template 'users/index'
      assert_select 'div#add_coldplay form.new_friendship_request'
      post friendship_requests_path, params: { to_user_id: @coldplay.id }
      sign_out users(:radiohead)
      follow_redirect!
      assert_template 'static_pages/home'
      assert_select 'div#user_nav a', count: 2
    end

    test 'user should sign in and decline a friend request' do
      @friendship_request = friendship_requests(:one)
      sign_in @coldplay
      get root_path
      assert_select 'div.signed_in_as', text: 'Signed in as Coldplay. Not you?'
      get friendship_requests_path
      assert_select 'div.friendship-request', count: 1
      assert_select 'form', count: 2
      delete friendship_request_path(@friendship_request), xhr: true
      assert_template 'friendship_requests/destroy'
      assert_select 'form', count: 0
      assert_select 'div', text: 'Declined'
    end

    test 'user should sign in and accept a friend request' do
      @friendship_request = friendship_requests(:one)
      @person_who_wants_to_be_friends = @friendship_request.user
      sign_in @coldplay
      get root_path
      assert_select 'div.signed_in_as', text: 'Signed in as Coldplay. Not you?'
      get friendship_requests_path
      assert_select 'div.friendship-request', count: 1
      assert_select 'form', count: 2
      post friendships_path, params: { friend_id: @person_who_wants_to_be_friends.id }, xhr: true
      assert_template 'friendships/create'
      assert_select 'form', count: 0
      assert_select 'div', text: 'Accepted'
    end

end
