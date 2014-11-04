class Update < ActiveRecord::Base
  belongs_to :user
  belongs_to :contract_comment
  
  validates :user, presence: true
  validates :contract_comment, presence: true
end
