class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :location
      t.datetime :started
      t.string :genre
      t.string :influence

      t.timestamps
    end
  end
end
