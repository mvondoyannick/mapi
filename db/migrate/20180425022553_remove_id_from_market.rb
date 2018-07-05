class RemoveIdFromMarket < ActiveRecord::Migration[5.1]
  def change
    remove_reference :markets, :vil, foreign_key: true
  end
end
