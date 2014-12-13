class Item < ActiveRecord::Base
  has_many :contracts
  has_many :warehouse_details
  belongs_to :unit
  
  
  def self.artikujt_e_njesis(depid)
    
    Item.where("department_id = ?", depid)
    #puts self.count
 
  end
  
  def self.search(search)
    if search
      Item.where( ['emertimi LIKE ?', "%#{search}%"])
    else
      Item.all
    end
  end
end