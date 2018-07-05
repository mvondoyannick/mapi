class RemoveCalendrierFromMarket < ActiveRecord::Migration[5.1]
  def change
    remove_reference :markets, :calendrier, foreign_key: true
  end
end
