class AddDepoToWarehouseDocument < ActiveRecord::Migration
  def change
    add_column :warehouse_documents, :depo, :integer
  end
end
