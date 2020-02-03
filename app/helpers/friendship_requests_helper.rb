module FriendshipRequestsHelper
    def send_friend_request(sender, receiver)
        sender.friendship_requests.create(to_user: receiver)
    end
end
