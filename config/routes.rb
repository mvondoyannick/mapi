Rails.application.routes.draw do
  resources :souhaits
  resources :varietes
  resources :produits
  resources :quartiers
  resources :arrondissements
  resources :calendriers
  resources :markets
  resources :types
  resources :vils
  resources :markets do 
  	resources :calendriers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
  	get 'market/:id/produit', to: 'api#tmp'

  	  #route pour afficher toutes les villes de la MIRAP
	  get 'villes/all', to: 'api#all'

	  #route pour afficher tous les marchés d'une villes
	  #get 'villes/:id/market', to: 'api#market'

	  #route pour afficher tous les magasins
	  get 'villes/:id/magasin', to: 'api#magasin'

	  #route marches periodique
	  get 'quartier/:id/market/periodique', to: 'api#periodique'

	  #route marches speciaux
	  get 'markets/:id/market/speciaux', to: 'api#speciaux'

	  #route marches speciaux de vente
	  get 'quartier/:id/market/vente', to: 'api#vente'

	  #route marches forain
	  get 'quartier/:id/market/forain', to: 'api#forain'

	  #Calendrier d'un marché
	  get 'markets/:id/caldav', to: 'api#association'

	  #route pour effectuer une recherche
	  get 'search/:query', to: 'api#search'

	  #route pour le detail de la recherche
	  get 'search/detail/:id/:name/:vil_id', to: 'api#search_detail'

	  #marché ayant la date la plus proche
	  get 'proximity/market', to: 'api#proximity'

	  #route pour afficher les arrondissements
	  get 'villes/:id/arrondissements', to: 'api#getArrondissement'

	  #route pour obtenir les quartiers
	  get 'arrondissement/:id/quartiers', to: 'api#getQuartier'

	  #nouvelle route pour afficher les marchés sur la base des quartiers
	  get 'quartier/:id/marches', to: 'api#getMarche'

	  get 'ville/:id/marches', to: 'api#getMarche'

	  #Route pour afficher les produits vendus dans un marché
	  get 'marche/:id/produits', to: 'api#getProduit'

	  #obtenir la liste de tous les produits pour le moment
	  get 'produits/all', to: 'api#getProduitAll'

	  #route pour poster un souhait
	  post 'souhait/:title/:detail', to: 'api#setSouhait'

    #obtenir une ville specific
    get 'ville/specific/:id', to: 'api#getSpecificVille'
  end

end
