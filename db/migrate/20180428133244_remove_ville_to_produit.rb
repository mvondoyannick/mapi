class RemoveVilleToProduit < ActiveRecord::Migration[5.1]
  def change
    remove_reference :produits, :vil, foreign_key: true
  end
end
