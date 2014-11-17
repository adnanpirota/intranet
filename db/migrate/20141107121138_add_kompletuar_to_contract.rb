class AddKompletuarToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :kompletuar, :boolean
  end
end
