class WarehouseDetail < ActiveRecord::Base
  belongs_to :warehouse_document
  belongs_to :item
end
