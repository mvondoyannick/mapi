class RemoveQuartierToProduit < ActiveRecord::Migration[5.1]
  def change
    remove_reference :produits, :quartier, foreign_key: true
  end
end
