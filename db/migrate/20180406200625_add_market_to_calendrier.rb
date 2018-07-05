class AddMarketToCalendrier < ActiveRecord::Migration[5.1]
  def change
    add_reference :calendriers, :market, foreign_key: true
  end
end
