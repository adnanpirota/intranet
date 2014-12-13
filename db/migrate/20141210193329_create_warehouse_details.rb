class CreateWarehouseDetails < ActiveRecord::Migration
  def change
    create_table :warehouse_details do |t|
      t.references :warehouse_document, index: true
      t.decimal :sasia
      t.decimal :cmimi

      t.timestamps
    end
  end
end
