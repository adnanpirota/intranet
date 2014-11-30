class CreateNjesia < ActiveRecord::Migration
  def change
    create_table :njesia do |t|
      t.string :njesia

      t.timestamps
    end
  end
end
