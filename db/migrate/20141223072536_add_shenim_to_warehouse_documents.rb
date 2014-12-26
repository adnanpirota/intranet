class AddShenimToWarehouseDocuments < ActiveRecord::Migration
  def change
    add_column :warehouse_documents, :shenim, :text
  end
end
