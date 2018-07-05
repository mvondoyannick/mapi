class CreateProduits < ActiveRecord::Migration[5.1]
  def change
    create_table :produits do |t|
      t.string :name
      t.string :prix
      t.string :quantite

      t.timestamps
    end
  end
end
