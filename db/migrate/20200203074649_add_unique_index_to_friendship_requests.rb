class AddUniqueIndexToFriendshipRequests < ActiveRecord::Migration[5.2]
  def change
    add_index :friendship_requests, [:user_id, :to_user_id], unique: true
  end
end
