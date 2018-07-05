class AddTypeToMarket < ActiveRecord::Migration[5.1]
  def change
    add_reference :markets, :type, foreign_key: true
  end
end
