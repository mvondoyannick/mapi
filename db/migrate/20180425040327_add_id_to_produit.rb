class AddIdToProduit < ActiveRecord::Migration[5.1]
  def change
    add_reference :produits, :variete, foreign_key: true
  end
end
