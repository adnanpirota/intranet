class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.string :arsyetimi
      t.references :user, index: true
      t.datetime :dita_pare
      t.datetime :dita_fundit
      t.decimal :totali_diteve

      t.timestamps null: false
    end
    add_index :leaves, [:user_id, :created_at]
  end
end
