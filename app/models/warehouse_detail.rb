class WarehouseDetail < ActiveRecord::Base
  belongs_to :warehouse_document #, -> { includes :item }
  belongs_to :item #, -> { includes :warehouse_document }
  
  
  #scope :artikujt_hyrje, -> { where(:pranimdalje, false)
  #scope :artikujt, ->(id) { artikujt_hyrje.where(item_id: id)}
  
  #spo bon me lambda shume vshtir se spo muj me kuptu :( 
  #scope :per_cmim, lambda { |*id| :conditions => ['pranimdalje = ? AND item_id = ?', false, id]
  
  #WarehouseDetail.find :all, :include => :item 
  
  def self.pranim
    where(pranimdalje: false)
  end
  
  def self.artikulli(id)
    where(item_id: id)
  end
  
  def self.per_cmim(id)
    
    pranim.artikulli(id)
  end
end