class AddIndexToUsersEmaili < ActiveRecord::Migration
  def change
    add_index :users, :emaili, unique: true
  end
end
