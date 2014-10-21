class User < ActiveRecord::Base
  before_save { self.emaili = emaili.downcase }
  
  validates :emri, presence: true, length: { maximum: 50 }
  validates :emaili, presence: true, length: { maximum: 255}, uniqueness: {case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }
  
  #def initialize
    #@emri = 'Adnan Pirota'
    #@emaili = 'adnanpirota2011@gmail.com'
    #@reparti = 1
    
  #end
  
  


end



