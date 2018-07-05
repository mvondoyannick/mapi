class AddVilleToProduit < ActiveRecord::Migration[5.1]
  def change
    add_reference :produits, :vil, foreign_key: true
  end
end
