class RemoveMarketToCalendrier < ActiveRecord::Migration[5.1]
  def change
    remove_reference :calendriers, :market, foreign_key: true
  end
end
