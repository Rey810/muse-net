class FriendshipRequest < ApplicationRecord
    belongs_to :user
    belongs_to :to_user, class_name: 'User'

    def self.send_friend_request(sender, receiver)
        self.create(user: sender, to_user: receiver)
    end

    def self.delete_request(current_user, requestor)
        where(user: requestor , to_user: current_user).destroy_all
    end
end
