class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: "User"

    def self.make_friendship(current_user, requestor)
        create(user: current_user, friend: requestor)
        create(user: requestor, friend: current_user)
    end

end
