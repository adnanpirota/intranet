class AddNdikuesToContractComments < ActiveRecord::Migration
  def change
    add_column :contract_comments, :ndikues, :boolean
  end
end
