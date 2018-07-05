class Api::ApiController < ApplicationController
  

  #retourne toutes les villes 
  def all
    #vil = Vil.all
    #rajout des images generiques
    vil = PpCity.all.where(country_id: 37)
    render json: vil
  end

  #jointure entre les tables markets et calendrier
  def association
  	market = params[:id]
  	render json: Market.find(market).calendriers.all
  end

  #affichage des marchés temoins périodique d'un quartier
  def periodique
  	vil = params[:id]
  	render json: Market.where(quartier_id: vil, type_id: 2)

  end

  #obtention d'une ville specifique
  def getSpecificVille
     m = params[:id]
     render json: PpCity.where(city_id: m)
  end


  #affichage des marchés temoins speciaux d'un quartier
  def speciaux
  	vil = params[:id]
  	render json: Market.where(quartier_id: vil, type_id: 3)
  end


  #affichage des marchés temoins de vente d'un quartier
  def vente
  	vil = params[:id]
  	render json: Market.where(quartier_id: vil, type_id: 4)
  	
  end


  #affichage des marchés forains d'un quarier
  def forain
  	quartier = params[:id]
  	render json: Market.where(quartier_id: quartier, type_id: 1)
  	
  end

  #Afficher la liste des magasins d'un quartier
  def magasin
  	vil = params[:id]
  	magasin = PpMarche.where(city_id: vil)
  	render json: magasin
  end

  #recherche des marchés
  def search
  	query = params[:query]
  	render json: Market.where("name LIKE '%#{query}%'")
  end

  #permet d'avoir les information detaillées sur un marché precedement recherché
  def search_detail
  	render json: Market.where(id: params[:id], name: params[:name], quartier_id: params[:vil_id])
  end

  #la date du marche le plus proche en terme de date
  def proximity
  	curentDate = Time.now

    #creation d'un tableau
    marketContainer = Array.new

  	#recherche de tous les calendrier
  	#caldav = Market.where("debut >= '#{curentDate}'").all

    #me retourne les dates de debut et de fin, mais egalemennt les IDs des differents marchés
    caldav = PpProgram.where("date_deb <= '#{curentDate}' ").limit(7)

    #recherche des noms des marchés concernés
    caldav.each do |m|
      result = PpMarche.find_by_marche_id(m.marche_id)
      marketContainer.push(result)
    end

  	#creation d'un tableau vide
  	#marche = Array.new 
  	#caldav.each do |f|
  	#	marche.push(Calendrier.find(f.id).markets.all)
  	#end
  	render json: marketContainer #caldav
  end

  #retourne les arrondissements par ville
  def getArrondissement
  	vil = params[:id]
  	render json: Arrondissement.where(vil_id: vil)
  end

  #une fonction temporaire
  def tmp
    p = Array.new
    truc = params[:id]
    temp = PpProductMarche.where(marche_id: truc)
    temp.each do |t|
    	#on recherche les produits programmés dans chaque marché
    	#p.push(t)
    	#kde = PpProduit.where(product_id: t.product_id)
    	p.push(PpProduct.where(product_id: t.product_id))
    end
    render json: p
  end

  #obtention des quartiers par arrondissement
  def getQuartier
  	arrondissement = params[:id]
  	render json: Quartier.where(arrondissement_id: arrondissement)
  end

  #obtention de la liste des marchés
  def getMarche
  	#on change le quarier pour la ville
  	#quartier = params[:id]
  	ville = params[:id]
  	#render json: Market.where(quartier_id: quartier)
  	render json: PpMarche.where(city_id: ville)
  end

  #obtention des differentes produits d'un marche
  def getProduit
    marche = params[:id]
    render json: Produit.where(market_id: marche)
  end

  #obtention de touts les produits enregistré
  def getProduitAll
  	render json: PpProduct.all
  end

  #envoi des souhaits 
  def setSouhait
    title = params[:title]
    detail = params[:detail]

    #on insert les informations dans la table Souhait
    insert = Souhait.create! title: title, detail: detail
    if insert.save
      render json: {
        "status": "saved",
        "date": Time.now,
        "data": insert
      }
    else
      render json: {
        "satus": "Failed to save",
        "date": Time.now,
        "errors": insert.errors.full_messages
      }
      
    end
  end

end
