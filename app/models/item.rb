class Item < ActiveRecord::Base
  has_many :contracts
  has_many :warehouse_details
  has_many :warehouse_documents, through: :warehouse_details
  
  belongs_to :unit
  
    scope :tenjesis, -> (njesia) { where(department_id: njesia)}
    
    scope :kerkimi_per_kartele, -> (search) { where("emertimi like ?", "%" + "#{search}" + "%")}  
end