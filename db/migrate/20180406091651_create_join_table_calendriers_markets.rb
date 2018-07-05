class CreateJoinTableCalendriersMarkets < ActiveRecord::Migration[5.1]
  def change
    create_join_table :calendriers, :markets do |t|
      # t.index [:calendrier_id, :market_id]
      # t.index [:market_id, :calendrier_id]
    end
  end
end
