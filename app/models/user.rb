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
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    
    BCrypt::Password.create(string, cost: cost)
  end


end



