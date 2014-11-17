class Contract < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :item
  has_many :contract_comments
  
end
