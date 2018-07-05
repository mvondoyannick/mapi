class AddCaldavToMarket < ActiveRecord::Migration[5.1]
  def change
    add_reference :markets, :calendrier, foreign_key: true
  end
end
