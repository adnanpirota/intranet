class AddItemToContracts < ActiveRecord::Migration
  def change
    add_reference :contracts, :item, index: true
  end
end
