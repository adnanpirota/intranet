class Supplier < ActiveRecord::Base
  has_many :contracts
  has_many :warehouse_documents
end
