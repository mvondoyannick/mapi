class AddPhotoToProduit < ActiveRecord::Migration[5.1]
  def change
    add_column :produits, :photo, :string
  end
end
