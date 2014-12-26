class AddNrfaturesToWarehouseDocuments < ActiveRecord::Migration
  def change
    add_column :warehouse_documents, :nrfatures, :string
  end
end
