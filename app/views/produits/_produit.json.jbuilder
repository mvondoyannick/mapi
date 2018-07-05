json.extract! produit, :id, :name, :prix, :quantite, :created_at, :updated_at
json.url produit_url(produit, format: :json)
