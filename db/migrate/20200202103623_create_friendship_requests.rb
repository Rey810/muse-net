class CreateFriendshipRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friendship_requests do |t|
      t.integer :user_id
      t.integer :to_user_id

      t.timestamps
    end
    add_index :friendship_requests, :user_id
    add_index :friendship_requests, :to_user_id
  end
end
