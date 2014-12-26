class WarehouseDocument < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :department
  belongs_to :user
  has_many :warehouse_details
  has_many :items, through: :warehouse_details
  
  
  scope :pranim, -> { where(pranimdalje: false)}
  scope :msillosi_depo, -> { where(depo: 6)}
  scope :pranim_desc, -> { pranim.order(id: :desc)}
  
  scope :dalje, -> { where(pranimdalje: true)}
  scope :dalje_msillosi, -> { where(depo: 6)}
  
  
end
