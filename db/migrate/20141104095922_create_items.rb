class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :emertimi
      t.text :pershkrimi

      t.timestamps
    end
  end
end
