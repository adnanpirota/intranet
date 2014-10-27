class Leave < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  #validates :arsyetimi, presence: true
  #validates :dita_pare, presence: true
  #validates :dita_fundit, presence: true
  #validates :totali_diteve, presence: true
end
