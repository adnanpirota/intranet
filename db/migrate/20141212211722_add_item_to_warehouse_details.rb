class AddItemToWarehouseDetails < ActiveRecord::Migration
  def change
    add_reference :warehouse_details, :item, index: true
  end
end
