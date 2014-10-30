class AddDaljaNePuneToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :dalja_ne_pune, :date
  end
end
