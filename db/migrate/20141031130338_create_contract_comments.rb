class CreateContractComments < ActiveRecord::Migration
  def change
    create_table :contract_comments do |t|
      t.references :contract, index: true
      t.string :komenti

      t.timestamps
    end
  end
end
