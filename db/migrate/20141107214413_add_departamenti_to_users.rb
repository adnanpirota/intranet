class AddDepartamentiToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :departamenti, index: true
  end
end
