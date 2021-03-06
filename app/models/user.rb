class User < ActiveRecord::Base
  has_many :leaves, dependent: :destroy
  has_many :updates, class_name: "Update",
                     foreign_key: "user_id",
                    dependent: :destroy
                    
  has_many :updates, through: :updates, source: :user
  has_many :warehouse_documents
  
  belongs_to :department
  #attr_accessor :remember_token, :activation_token
  before_save :downcase_email
  #before_create :create_activation_digest
  validates :emri, presence: true, length: { maximum: 50 }
  validates :emaili, presence: true, length: { maximum: 255}, uniqueness: {case_sensitive: false }
  mount_uploader :picture, PictureUploader  
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true
  validate :picture_size
  
  #def initialize
    #@emri = 'Adnan Pirota'
    #@emaili = 'adnanpirota2011@gmail.com'
    #@reparti = 1
    
  #end
  
  # Returns the hash digest of the given string.
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    
    BCrypt::Password.create(string, cost: cost)
  end
  
  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Leave.where("user_id = ?", id)
    
  end
  
  # Follows a contract
  def follow(contract_comment)
    updates.create(contract_comment: contract_comment)
  end
  
  #Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def new_token
    SecureRandom.urlsafe_base64
  end
  # Rememember a user in the database for use in persistent sessions.
  def remember 
    self.remember_token = User.new_token
    #update_attribute(:remember_digest, User.digest(remember_token))
    #self.update_attribute(:remember_digest, new_token)
    self.update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)  
  end
  
  # Forget a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  private
  
    # Converts email to all lower-case
    def downcase_email
      self.emaili = emaili.downcase
    end
    
    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
    
    # Validates the size of the picture
    def picture_size
      if picture.size > 1.megabytes
        errors.add(:picture, "duhet te jete me e vogel se 1MB")
      end
    end
    
    def create_remember_token
      self.remember_token = user.digest(User.new_remember_token)
    end


end



