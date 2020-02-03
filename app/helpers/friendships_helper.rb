module FriendshipsHelper
    def make_friendship(current_user, requested_friend)
        current_user.friendship.create(friend: requested_friend)
    end

end
