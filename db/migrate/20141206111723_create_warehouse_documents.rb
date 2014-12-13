class CreateWarehouseDocuments < ActiveRecord::Migration
  def change
    create_table :warehouse_documents do |t|
      t.boolean :pranimdalje
      t.references :supplier, index: true
      t.references :department, index: true
      t.datetime :dataora

      t.timestamps
    end
  end
end
