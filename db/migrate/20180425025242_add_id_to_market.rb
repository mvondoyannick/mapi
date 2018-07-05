class AddIdToMarket < ActiveRecord::Migration[5.1]
  def change
    add_reference :markets, :quartier, foreign_key: true
  end
end
