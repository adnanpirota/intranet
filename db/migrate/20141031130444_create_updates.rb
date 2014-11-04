class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.references :user, index: true
      t.references :contract_comment, index: true

      t.timestamps
    end
  end
end
