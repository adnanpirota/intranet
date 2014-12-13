class WarehouseDocument < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :department
  has_many :warehouse_details
  
  scope :msillosi, -> { where(depo: 6)}
end
