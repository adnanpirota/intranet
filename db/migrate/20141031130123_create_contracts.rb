class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :numri_kontrates
      t.integer :sasia
      t.decimal :cmimi
      t.integer :avansi
      t.decimal :pjesa_mbetur_per_pagese
      t.date :koha_arritjes_port
      t.date :koha_reale_arritjes_port

      t.timestamps
    end
  end
end
