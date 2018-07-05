class Produit < ApplicationRecord
	belongs_to :variete
	belongs_to :market
	mount_uploader :photo, ProduitUploader
end
