class AddSupplierToContracts < ActiveRecord::Migration
  def change
    add_reference :contracts, :supplier, index: true
  end
end
