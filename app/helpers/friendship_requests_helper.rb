module FriendshipRequestsHelper
    def send_friend_request(sender, receiver)
        sender.friendship_requests.create(to_user: receiver)
    end

    def any_friend_requests?(current_user)
        FriendshipRequest.exists?(to_user: current_user)
    end

    def num_of_friendship_requests
        FriendshipRequest.where(to_user: current_user).count
    end
end
