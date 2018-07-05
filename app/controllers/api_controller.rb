class ApiController < ApplicationController
  

  #retourne toutes les villes 
  def all
    vil = Vil.all
    render json: vil
  end

  #Afficher la liste des marchés par villes
  #def market
  #	vil = params[:id]
  #	market = Market.where(vil_id: vil)
  #	render json: market
  #end

  #jointure entre les tables markets et calendrier
  def association
  	market = params[:id]
  	render json: Market.find(market).calendriers.all
  end

  #affichage des marchés temoins périodique d'un quartier
  def periodique
  	vil = params[:id]
  	render json: Market.where(vil_id: vil, type_id: 2)

  end


  #affichage des marchés temoins speciaux d'un quartier
  def speciaux
  	vil = params[:id]
  	render json: Market.where(vil_id: vil, type_id: 3)
  	
  end


  #affichage des marchés temoins de vente d'un quartier
  def vente
  	vil = params[:id]
  	render json: Market.where(vil_id: vil, type_id: 4)
  	
  end


  #affichage des marchés forains d'un quarier
  def forain
  	vil = params[:id]
  	render json: Market.where(vil_id: vil, type_id: 1)
  	
  end

  #Afficher la liste des magasins d'un quartier
  def magasin
  	vil = params[:id]
  	magasin = Market.where(vil_id: vil, type_id: 5)
  	render json: magasin
  end

  #recherche des marchés
  def search
  	query = params[:query]
  	render json: Market.where("name LIKE '%#{query}%'")
  end

  #permet d'avoir les information detaillées sur un marché precedement recherché
  def search_detail
  	render json: Market.where(id: params[:id], name: params[:name], vil_id: params[:vil_id])
  end

  #la date du marche le plus proche
  def proximity
  	curentDate = Time.now

  	#recherche de tous les calendrier
  	caldav = Calendrier.where("date >= '#{curentDate}'")

  	#creation d'un tableau vide
  	marche = Array.new 
  	caldav.each do |f|
  		marche.push(Calendrier.find(f.id).markets.all)
  	end
  	render json: marche
  end

  #retourne les arrondissements par ville
  def getArrondissement
  	vil = params[:id]
  	render json: Arrondissement.where(vil_id: vil)
  end

  #obtention des quartiers par arrondissement
  def getQuartier
  	arrondissement = params[:id]
  	render json: Quartier.where(arrondissement_id: arrondissement)
  end

  #obtention de la liste des marchés
  def getMarche
  	quartier = params[:id]
  	render json: Market.where(quartier_id: quartier)
  end

  #obtention des differentes categories existantes

end