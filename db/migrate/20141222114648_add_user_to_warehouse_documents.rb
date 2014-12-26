class AddUserToWarehouseDocuments < ActiveRecord::Migration
  def change
    add_reference :warehouse_documents, :user, index: true
  end
end
