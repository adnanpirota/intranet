class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :emri
      t.string :telefoni
      t.string :emaili

      t.timestamps
    end
  end
end
