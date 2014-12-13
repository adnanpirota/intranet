class AddRequestIdToWarehouseDocuments < ActiveRecord::Migration
  def change
    add_column :warehouse_documents, :request_id, :integer
  end
end
