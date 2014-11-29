class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :njesia

      t.timestamps
    end
  end
end
