class ChangeStartedToBeIntegerInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :started, :datetime
    add_column :users, :started, :integer
  end
end
