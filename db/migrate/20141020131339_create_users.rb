class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :emri
      t.string :emaili

      t.timestamps
    end
  end
end
