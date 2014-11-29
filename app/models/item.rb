class Item < ActiveRecord::Base
  has_many :contracts
  belongs_to :unit
  
 
  
  
  def self.search(search)
    if search
      Item.where( ['emertimi LIKE ?', "%#{search}%"])
    else
      Item.all
    end
  end
end
