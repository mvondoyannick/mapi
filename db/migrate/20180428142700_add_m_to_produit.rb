class AddMToProduit < ActiveRecord::Migration[5.1]
  def change
    add_reference :produits, :market, foreign_key: true
  end
end
