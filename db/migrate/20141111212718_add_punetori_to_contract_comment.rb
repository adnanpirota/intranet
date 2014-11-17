class AddPunetoriToContractComment < ActiveRecord::Migration
  def change
    add_column :contract_comments, :punetori, :string
  end
end
