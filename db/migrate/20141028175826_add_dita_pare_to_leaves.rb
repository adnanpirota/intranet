class AddDitaPareToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :dita_pare, :date
  end
end
