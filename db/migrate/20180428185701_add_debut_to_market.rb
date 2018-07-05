class AddDebutToMarket < ActiveRecord::Migration[5.1]
  def change
    add_column :markets, :debut, :string
    add_column :markets, :fin, :string
  end
end
