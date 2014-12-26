class AddPranimDaljeToWarehouseDetails < ActiveRecord::Migration
  def change
    add_column :warehouse_details, :pranimdalje, :boolean
  end
end
