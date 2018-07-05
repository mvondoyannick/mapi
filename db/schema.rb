# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180428185701) do

  create_table "arrondissements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.bigint "vil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vil_id"], name: "index_arrondissements_on_vil_id"
  end

  create_table "calendriers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendriers_markets", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "calendrier_id", null: false
    t.bigint "market_id", null: false
  end

  create_table "markets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_id"
    t.bigint "quartier_id"
    t.string "debut"
    t.string "fin"
    t.index ["quartier_id"], name: "index_markets_on_quartier_id"
    t.index ["type_id"], name: "index_markets_on_type_id"
  end

  create_table "pp_account_transaction", primary_key: "account_transaction_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "sender_customer_id"
    t.integer "receive_customer_id"
    t.integer "agence_id"
    t.integer "service_id", null: false
    t.integer "type_carburant", null: false
    t.string "sens", limit: 4, null: false
    t.timestamp "date_trans", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "year", null: false
    t.integer "month", null: false
    t.integer "day", null: false
    t.float "somme_tran", limit: 53
    t.float "somme_cour", limit: 53
    t.float "somme_courc", limit: 53
    t.float "somme_tranc", limit: 53
    t.boolean "status", default: true, null: false
    t.integer "transaction_s_id", null: false
    t.integer "transaction_ss_id", null: false
    t.integer "customer_service_id"
    t.integer "customer_service1_id"
    t.integer "admin_id"
  end

  create_table "pp_address", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "address_id", null: false
    t.integer "customer_id", null: false
    t.string "firstname", limit: 32, null: false
    t.string "lastname", limit: 32, null: false
    t.string "company", limit: 40, null: false
    t.string "address_1", limit: 128, null: false
    t.string "address_2", limit: 128, null: false
    t.string "city", limit: 128, null: false
    t.string "postcode", limit: 10, null: false
    t.integer "country_id", default: 0, null: false
    t.integer "zone_id", default: 0, null: false
    t.text "custom_field", null: false
  end

  create_table "pp_affiliate", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "affiliate_id", null: false
    t.string "firstname", limit: 32, null: false
    t.string "lastname", limit: 32, null: false
    t.string "email", limit: 96, null: false
    t.string "telephone", limit: 100, null: false
    t.string "telephone_orange", limit: 120
    t.string "fax", limit: 32, null: false
    t.string "password", limit: 40, null: false
    t.string "salt", limit: 9, null: false
    t.string "company", limit: 40, null: false
    t.string "website", null: false
    t.string "address_1", limit: 128, null: false
    t.string "address_2", limit: 128, null: false
    t.string "city", limit: 128, null: false
    t.string "postcode", limit: 10, null: false
    t.integer "country_id", null: false
    t.integer "zone_id", null: false
    t.string "code", limit: 64, null: false
    t.decimal "commission", precision: 4, scale: 2, default: "0.0", null: false
    t.string "tax", limit: 64, null: false
    t.string "payment", limit: 6, null: false
    t.string "cheque", limit: 100, null: false
    t.string "paypal", limit: 64, null: false
    t.string "bank_name", limit: 64, null: false
    t.string "bank_branch_number", limit: 64, null: false
    t.string "bank_swift_code", limit: 64, null: false
    t.string "bank_account_name", limit: 64, null: false
    t.string "bank_account_number", limit: 64, null: false
    t.string "ip", limit: 40, null: false
    t.boolean "status", null: false
    t.boolean "approved", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_affiliate_activity", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "affiliate_activity_id", null: false
    t.integer "affiliate_id", null: false
    t.string "key", limit: 64, null: false
    t.text "data", null: false
    t.string "ip", limit: 40, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_affiliate_crossroads", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "id_table", null: false
    t.integer "affiliate_id", null: false
    t.integer "crossroads_id", null: false
    t.boolean "status", default: true, null: false
    t.string "token", limit: 120
  end

  create_table "pp_affiliate_login", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "affiliate_login_id", null: false
    t.string "email", limit: 96, null: false
    t.string "ip", limit: 40, null: false
    t.integer "total", null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_affiliate_manufacturer", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "affiliate_id", null: false
    t.integer "manufacturer_id", null: false
    t.boolean "status", default: true, null: false
  end

  create_table "pp_affiliate_services", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "affiliate_service_id", null: false
    t.integer "affiliate_id"
    t.integer "service_id", null: false
    t.string "codenip", limit: 128
    t.boolean "droits", default: true, null: false
    t.boolean "status", default: true, null: false
    t.integer "language_id"
    t.integer "institution_id"
    t.integer "admin_id"
    t.integer "temoin"
    t.string "token", limit: 64
  end

  create_table "pp_affiliate_stations", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "affiliate_station_id", null: false
    t.integer "affiliate_id", null: false
    t.integer "station_id", null: false
  end

  create_table "pp_affiliate_transaction", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "affiliate_transaction_id", null: false
    t.integer "affiliate_id", null: false
    t.integer "order_id", null: false
    t.text "description", null: false
    t.decimal "amount", precision: 15, scale: 4, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_agences", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "agence_id", null: false
    t.integer "city_id", null: false
    t.integer "zone_id", null: false
    t.integer "country_id", null: false
    t.string "name", limit: 128, null: false
    t.string "detailsfr", limit: 120
    t.string "detailsen", limit: 120
    t.string "code", limit: 32, null: false
    t.boolean "status", default: true, null: false
    t.integer "ordre", null: false
    t.string "token", limit: 64
    t.string "type_agence", limit: 25
  end

  create_table "pp_agences_agences", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "agence_agence_id", null: false
    t.integer "agence_1_id", null: false
    t.integer "agence_2_id", null: false
    t.datetime "date_cre", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "ordre_inst", null: false
  end

  create_table "pp_alertbanque", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "alert_id", null: false
    t.timestamp "date_add", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "numero", limit: 13, null: false
    t.integer "etat"
    t.integer "menu", null: false
  end

  create_table "pp_alerts", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "alerts_id", null: false
    t.integer "customer_id", null: false
    t.integer "crossroads_id", null: false
    t.integer "message_id", null: false
    t.timestamp "date_add", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "etat", null: false
    t.integer "abonnement_type"
    t.integer "intervalle"
  end

  create_table "pp_all", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ANNEE"
    t.string "rechercheV", limit: 46
    t.string "Compte Client", limit: 14
    t.string "intitule_Compte", limit: 35
    t.string "Date", limit: 10, null: false
    t.integer "Mois Nr."
    t.string "Mois Name", limit: 9
    t.string "C.j", limit: 2
    t.integer "N° pièce"
    t.string "Libellé écriture", limit: 35
    t.string "Info1", limit: 2
    t.string "Debit", limit: 12
    t.integer "Comptes Gnrx"
    t.string "Libellé", limit: 35
    t.string "Groupe", limit: 20
    t.string "Credit_Cpte70", limit: 12
    t.string "ECART", limit: 1
    t.string "Commentaire", limit: 10
  end

  create_table "pp_api", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "api_id", null: false
    t.string "name", limit: 64, null: false
    t.text "key", null: false
    t.boolean "status", null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_api_ip", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "api_ip_id", null: false
    t.integer "api_id", null: false
    t.string "ip", limit: 40, null: false
  end

  create_table "pp_api_session", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "api_session_id", null: false
    t.integer "api_id", null: false
    t.string "token", limit: 32, null: false
    t.string "session_id", limit: 32, null: false
    t.string "session_name", limit: 32, null: false
    t.string "ip", limit: 40, null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_arrondissements", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "arrondissement_id", null: false
    t.integer "country_id", null: false
    t.integer "zone_id", null: false
    t.integer "departement_id", null: false
    t.integer "sort_order", null: false
    t.string "name", limit: 128, null: false
    t.string "code", limit: 10, null: false
    t.boolean "status", default: true, null: false
  end

  create_table "pp_attribute", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "attribute_id", null: false
    t.integer "attribute_group_id", null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_attribute_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "attribute_id", null: false
    t.integer "language_id", null: false
    t.string "name", limit: 64, null: false
  end

  create_table "pp_attribute_group", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "attribute_group_id", null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_attribute_group_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "attribute_group_id", null: false
    t.integer "language_id", null: false
    t.string "name", limit: 64, null: false
  end

  create_table "pp_banner", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "banner_id", null: false
    t.string "name", limit: 64, null: false
    t.boolean "status", null: false
  end

  create_table "pp_banner_image", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "banner_image_id", null: false
    t.integer "banner_id", null: false
    t.integer "language_id", null: false
    t.string "title", limit: 64, null: false
    t.text "description", null: false
    t.string "link", null: false
    t.string "image", null: false
    t.integer "sort_order", default: 0, null: false
  end

  create_table "pp_carbutransactions", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id_transaction", null: false
    t.integer "id_customer", null: false
    t.string "phone", limit: 30, null: false
    t.float "somme", limit: 24, null: false
    t.timestamp "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "date_fin", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "type_trans", limit: 2, null: false
    t.integer "service", null: false
    t.integer "id_marqueteur", null: false
    t.integer "type_carburant", null: false
    t.integer "approbation", default: 0
  end

  create_table "pp_cart", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cart_id", null: false, unsigned: true
    t.integer "api_id", null: false
    t.integer "customer_id", null: false
    t.string "session_id", limit: 32, null: false
    t.integer "product_id", null: false
    t.integer "recurring_id", null: false
    t.text "option", null: false
    t.integer "quantity", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_categorie", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "categorie_id", null: false
    t.integer "ordre", null: false
    t.string "name_fr", limit: 128, null: false
    t.string "name_en", limit: 60, null: false
    t.string "code", limit: 32
    t.boolean "status", default: true, null: false
    t.string "session", limit: 60, null: false
  end

  create_table "pp_category", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id", null: false
    t.string "image"
    t.integer "parent_id", default: 0, null: false
    t.boolean "top", null: false
    t.integer "column", null: false
    t.integer "sort_order", default: 0, null: false
    t.boolean "status", null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_category_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id", null: false
    t.integer "language_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.string "meta_title", null: false
    t.string "meta_description", null: false
    t.string "meta_keyword", null: false
  end

  create_table "pp_category_filter", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id", null: false
    t.integer "filter_id", null: false
  end

  create_table "pp_category_path", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id", null: false
    t.integer "path_id", null: false
    t.integer "level", null: false
  end

  create_table "pp_category_to_layout", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id", null: false
    t.integer "store_id", null: false
    t.integer "layout_id", null: false
  end

  create_table "pp_category_to_store", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id", null: false
    t.integer "store_id", null: false
  end

  create_table "pp_city", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "city_id", null: false
    t.integer "zone_id", null: false
    t.integer "country_id", null: false
    t.integer "departement_id", null: false
    t.integer "sort_order", null: false
    t.string "name", limit: 128, null: false
    t.string "code", limit: 32, null: false
    t.boolean "status", default: true, null: false
    t.integer "language_id", default: 1, null: false
  end

  create_table "pp_commandes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "commande_id", null: false
    t.integer "magasin_id", null: false
    t.integer "customer_id", null: false
    t.integer "product_id", null: false
    t.integer "unite_id", null: false
    t.integer "qte", null: false
    t.integer "prix", null: false
    t.timestamp "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "date_fin", null: false
    t.string "session", limit: 256, null: false
  end

  create_table "pp_consommation", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "consommation_id", null: false
    t.integer "customer_service_id", null: false
    t.integer "affiliate_id", null: false
    t.string "montant", limit: 128, null: false
    t.integer "type_carburant"
    t.timestamp "date_tran", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "statut", default: true, null: false
  end

  create_table "pp_cotisations", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "cotisation_id", null: false
    t.integer "manufacturer_id", null: false
    t.string "montant", limit: 128, null: false
    t.string "numero_cotisation", limit: 128, null: false
    t.timestamp "date_add", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "pp_country", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "country_id", null: false
    t.string "name", limit: 128, null: false
    t.string "iso_code_2", limit: 2, null: false
    t.string "iso_code_3", limit: 3, null: false
    t.text "address_format", null: false
    t.boolean "postcode_required", null: false
    t.boolean "status", default: true, null: false
    t.integer "language_id", default: 1, null: false
  end

  create_table "pp_coupon", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "coupon_id", null: false
    t.string "name", limit: 128, null: false
    t.string "code", limit: 20, null: false
    t.string "type", limit: 1, null: false
    t.decimal "discount", precision: 15, scale: 4, null: false
    t.boolean "logged", null: false
    t.boolean "shipping", null: false
    t.decimal "total", precision: 15, scale: 4, null: false
    t.date "date_start", null: false
    t.date "date_end", null: false
    t.integer "uses_total", null: false
    t.string "uses_customer", limit: 11, null: false
    t.boolean "status", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_coupon_category", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "coupon_id", null: false
    t.integer "category_id", null: false
  end

  create_table "pp_coupon_history", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "coupon_history_id", null: false
    t.integer "coupon_id", null: false
    t.integer "order_id", null: false
    t.integer "customer_id", null: false
    t.decimal "amount", precision: 15, scale: 4, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_coupon_product", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "coupon_product_id", null: false
    t.integer "coupon_id", null: false
    t.integer "product_id", null: false
  end

  create_table "pp_crossroads", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "crossroads_id", null: false
    t.integer "city_id", null: false
    t.integer "zone_id", null: false
    t.integer "country_id", null: false
    t.string "name", limit: 128, null: false
    t.string "code", limit: 32, null: false
    t.boolean "status", default: true, null: false
    t.integer "ordre", null: false
  end

  create_table "pp_currency", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "currency_id", null: false
    t.string "title", limit: 32, null: false
    t.string "code", limit: 3, null: false
    t.string "symbol_left", limit: 12, null: false
    t.string "symbol_right", limit: 12, null: false
    t.string "decimal_place", limit: 1, null: false
    t.float "value", limit: 24, null: false
    t.boolean "status", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_custom_field", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "custom_field_id", null: false
    t.string "type", limit: 32, null: false
    t.text "value", null: false
    t.string "validation", null: false
    t.string "location", limit: 7, null: false
    t.boolean "status", null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_custom_field_customer_group", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "custom_field_id", null: false
    t.integer "customer_group_id", null: false
    t.boolean "required", null: false
  end

  create_table "pp_custom_field_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "custom_field_id", null: false
    t.integer "language_id", null: false
    t.string "name", limit: 128, null: false
  end

  create_table "pp_custom_field_value", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "custom_field_value_id", null: false
    t.integer "custom_field_id", null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_custom_field_value_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "custom_field_value_id", null: false
    t.integer "language_id", null: false
    t.integer "custom_field_id", null: false
    t.string "name", limit: 128, null: false
  end

  create_table "pp_customer", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_id", null: false
    t.integer "customer_group_id", default: 1, null: false
    t.integer "store_id", default: 0, null: false
    t.integer "language_id", null: false
    t.string "firstname", limit: 32
    t.string "lastname", limit: 32
    t.string "email", limit: 96
    t.string "telephone", limit: 96
    t.string "telephone_orange", limit: 96
    t.string "fax", limit: 32
    t.string "password", limit: 40
    t.string "salt", limit: 9
    t.text "cart"
    t.text "wishlist"
    t.boolean "newsletter", default: false
    t.integer "address_id", default: 0
    t.text "custom_field"
    t.string "ip", limit: 40
    t.boolean "status"
    t.boolean "approved"
    t.boolean "safe"
    t.text "token"
    t.string "code", limit: 40
    t.datetime "date_added", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "city_id"
    t.string "nipcode", limit: 40, null: false
    t.string "phone", limit: 96, null: false
    t.string "paroisse", limit: 60
    t.string "session", limit: 120
    t.integer "service"
    t.integer "balance", default: 0, null: false
    t.integer "abonnement"
    t.string "question", limit: 128, null: false
    t.string "answer", limit: 128, null: false, collation: "utf8_spanish_ci"
    t.integer "droit", default: 1, null: false
    t.integer "id_marqueteur", null: false
  end

  create_table "pp_customer_activity", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_activity_id", null: false
    t.integer "customer_id", null: false
    t.string "key", limit: 64, null: false
    t.text "data", null: false
    t.string "ip", limit: 40, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_customer_city", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_id", null: false
    t.integer "city_id", null: false
    t.integer "service_id", null: false
    t.string "session", limit: 120, null: false
    t.datetime "date_cre", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "etat", default: 1, null: false
  end

  create_table "pp_customer_cotisations", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_id", null: false
    t.integer "manufacturer_id", null: false
    t.integer "cotisation_id", null: false
    t.timestamp "date_add", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "pp_customer_crossroads", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_crossroads_id", null: false
    t.integer "customer_id", null: false
    t.integer "crossroads_id", null: false
    t.integer "city_id", null: false
    t.datetime "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "date_fin"
    t.integer "statut", null: false
    t.integer "rang", null: false
    t.integer "temoin", default: 0, null: false
    t.string "token", limit: 90
  end

  create_table "pp_customer_group", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_group_id", null: false
    t.integer "approval", null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_customer_group_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_group_id", null: false
    t.integer "language_id", null: false
    t.string "name", limit: 32, null: false
    t.text "description", null: false
  end

  create_table "pp_customer_history", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_history_id", null: false
    t.integer "customer_id", null: false
    t.text "comment", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_customer_info", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_info_id", null: false
    t.integer "customer_id", null: false
    t.integer "admin_id", null: false
    t.string "account", limit: 64, null: false
    t.string "banque", limit: 32, null: false
    t.string "phone", limit: 32, null: false
    t.boolean "status", default: true, null: false
    t.integer "temoin", null: false
  end

  create_table "pp_customer_ip", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_ip_id", null: false
    t.integer "customer_id", null: false
    t.string "ip", limit: 40, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_customer_login", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_login_id", null: false
    t.string "email", limit: 96, null: false
    t.string "ip", limit: 40, null: false
    t.integer "total", null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_customer_magasins", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_id", null: false
    t.integer "magasin_id", null: false
    t.integer "product_id", null: false
    t.string "session", limit: 120
    t.datetime "date_cre", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "etat", default: 1, null: false
  end

  create_table "pp_customer_manufacturer", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_id", null: false
    t.integer "manufacturer_id", null: false
    t.string "session", limit: 120
    t.datetime "date_cre", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "etat", default: 1, null: false
    t.string "prenom", limit: 60
    t.string "nom", limit: 60
  end

  create_table "pp_customer_marches", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_id", null: false
    t.integer "marche_id", null: false
    t.string "session", limit: 120
    t.datetime "date_cre", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "etat", default: 1, null: false
    t.string "prenom", limit: 60
    t.string "nom", limit: 60
  end

  create_table "pp_customer_online", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "ip", limit: 40, null: false
    t.integer "customer_id", null: false
    t.text "url", null: false
    t.text "referer", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_customer_paroisse", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_id", null: false
    t.integer "paroisse_id", null: false
    t.string "session", limit: 120, null: false
    t.datetime "date_cre", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "etat", default: 1, null: false
  end

  create_table "pp_customer_presbyteriat", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_id", null: false
    t.integer "presbyteriat_id", null: false
    t.string "session", limit: 120, null: false
    t.datetime "date_cre", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "etat", default: 1, null: false
  end

  create_table "pp_customer_product", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "customer_product_magasin_id", null: false
    t.integer "customer_id", null: false
    t.integer "magasin_id", null: false
    t.integer "product_id", null: false
    t.timestamp "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "session", limit: 300, null: false
  end

  create_table "pp_customer_reward", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_reward_id", null: false
    t.integer "customer_id", default: 0, null: false
    t.integer "order_id", default: 0, null: false
    t.text "description", null: false
    t.integer "points", default: 0, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_customer_search", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_search_id", null: false
    t.integer "store_id", null: false
    t.integer "language_id", null: false
    t.integer "customer_id", null: false
    t.string "keyword", null: false
    t.integer "category_id"
    t.boolean "sub_category", null: false
    t.boolean "description", null: false
    t.integer "products", null: false
    t.string "ip", limit: 40, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_customer_services", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_service_id", null: false
    t.integer "customer_id"
    t.integer "customer_group_id", default: 1, null: false
    t.integer "service_id", null: false
    t.integer "type_carburant", null: false
    t.integer "id_marqueteur", null: false
    t.string "phone", limit: 128
    t.string "codenip", limit: 128
    t.boolean "droits", default: true, null: false
    t.boolean "status", default: true, null: false
    t.integer "language_id"
    t.integer "institution_id"
    t.integer "admin_id"
    t.integer "temoin"
    t.string "token", limit: 64
    t.string "aphone", limit: 90
    t.float "somme", limit: 24, null: false
  end

  create_table "pp_customer_specialites", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_id", null: false
    t.integer "specialite_id", null: false
    t.string "session", limit: 120
    t.datetime "date_cre", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "etat", default: 1, null: false
    t.string "prenom", limit: 60
    t.string "nom", limit: 60
  end

  create_table "pp_customer_synode", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_id", null: false
    t.integer "synode_id", null: false
    t.string "session", limit: 120, null: false
    t.datetime "date_cre", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "etat", default: 1, null: false
  end

  create_table "pp_customer_transaction", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_transaction_id", null: false
    t.integer "customer_id", null: false
    t.integer "order_id", null: false
    t.text "description", null: false
    t.decimal "amount", precision: 15, scale: 4, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_customer_villes", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_villes_id", null: false
    t.integer "customer_id", null: false
    t.integer "city_id", null: false
    t.datetime "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "date_fin"
    t.integer "statut", null: false
    t.integer "rang", null: false
    t.integer "temoin", default: 0, null: false
    t.string "token", limit: 90
  end

  create_table "pp_customer_wishlist", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "customer_id", null: false
    t.integer "product_id", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_demande", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "demande_id", null: false
    t.integer "customer_id", null: false
    t.integer "quantite", null: false
    t.timestamp "date_dem", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "etat", default: false, null: false
    t.integer "service_id", null: false
    t.integer "transaction_s_id", null: false
    t.integer "transaction_ss_id", null: false
  end

  create_table "pp_departement", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "departement_id", null: false
    t.integer "country_id", null: false
    t.integer "zone_id", null: false
    t.string "name", limit: 128, null: false
    t.string "code", limit: 32, null: false
    t.boolean "status", default: true, null: false
    t.integer "sort_order", default: 0, null: false
    t.integer "language_id", default: 1, null: false
  end

  create_table "pp_districts", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "district_id", null: false
    t.integer "country_id", null: false
    t.integer "zone_id", null: false
    t.integer "departement_id", null: false
    t.integer "city_id", null: false
    t.string "code", limit: 10, null: false
    t.integer "sort_order", null: false
    t.string "name", limit: 128, null: false
    t.boolean "status", default: true, null: false
  end

  create_table "pp_download", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "download_id", null: false
    t.string "filename", limit: 160, null: false
    t.string "mask", limit: 128, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_download_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "download_id", null: false
    t.integer "language_id", null: false
    t.string "name", limit: 64, null: false
  end

  create_table "pp_envoie", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "message_id", null: false
    t.integer "crossroads_id", null: false
    t.integer "customer_id", null: false
    t.timestamp "date_add", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "statut", null: false
  end

  create_table "pp_envoiem", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "envoim_id", null: false
    t.timestamp "date_add", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "token", limit: 150
    t.string "name", limit: 60
    t.integer "service", null: false
    t.string "session", limit: 160, null: false
    t.string "message", limit: 120, null: false
    t.integer "statut", null: false
  end

  create_table "pp_envoiemt", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "envoim_id", null: false
    t.timestamp "date_add", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "token", limit: 200
    t.integer "service", null: false
    t.string "session", limit: 160, null: false
  end

  create_table "pp_event", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "event_id", null: false
    t.string "code", limit: 32, null: false
    t.text "trigger", null: false
    t.text "action", null: false
    t.boolean "status", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_extension", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "extension_id", null: false
    t.string "type", limit: 32, null: false
    t.string "code", limit: 32, null: false
  end

  create_table "pp_filter", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "filter_id", null: false
    t.integer "filter_group_id", null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_filter_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "filter_id", null: false
    t.integer "language_id", null: false
    t.integer "filter_group_id", null: false
    t.string "name", limit: 64, null: false
  end

  create_table "pp_filter_group", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "filter_group_id", null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_filter_group_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "filter_group_id", null: false
    t.integer "language_id", null: false
    t.string "name", limit: 64, null: false
  end

  create_table "pp_forum", primary_key: "forum_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 64, null: false
    t.text "description", null: false
    t.string "username", limit: 50, null: false
    t.string "email", limit: 50, null: false
    t.string "avatar", limit: 100, null: false
    t.boolean "status", null: false
    t.integer "views", null: false
    t.timestamp "date", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "pp_forum_image", primary_key: "forum_image_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "forum_id", null: false
    t.string "image", null: false
  end

  create_table "pp_forum_image_description", primary_key: ["forum_image_id", "language_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "forum_image_id", null: false
    t.integer "language_id", null: false
    t.integer "forum_id", null: false
    t.string "title", limit: 64, null: false
  end

  create_table "pp_forum_reply", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "forum_id", null: false
    t.string "username", limit: 50, null: false
    t.string "email", limit: 50, null: false
    t.string "avatar", limit: 100, null: false
    t.string "reply", limit: 500, null: false
    t.timestamp "date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "status", null: false
  end

  create_table "pp_geo_zone", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "geo_zone_id", null: false
    t.string "name", limit: 32, null: false
    t.string "description", null: false
    t.datetime "date_modified", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_information", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "information_id", null: false
    t.integer "bottom", default: 0, null: false
    t.integer "sort_order", default: 0, null: false
    t.boolean "status", default: true, null: false
  end

  create_table "pp_information_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "information_id", null: false
    t.integer "language_id", null: false
    t.string "title", limit: 64, null: false
    t.text "description", null: false
    t.string "meta_title", null: false
    t.string "meta_description", null: false
    t.string "meta_keyword", null: false
  end

  create_table "pp_information_to_layout", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "information_id", null: false
    t.integer "store_id", null: false
    t.integer "layout_id", null: false
  end

  create_table "pp_information_to_store", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "information_id", null: false
    t.integer "store_id", null: false
  end

  create_table "pp_informations", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "information_id", null: false
    t.integer "manufacturer_id", null: false
    t.integer "affiliate_id", null: false
    t.integer "categorie_id", null: false
    t.string "name_fr", limit: 128
    t.string "name_en", limit: 128
    t.date "date_add", null: false
    t.date "date_end", null: false
    t.string "session", limit: 120, null: false
    t.integer "ordre"
  end

  create_table "pp_language", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "language_id", null: false
    t.string "name", limit: 32, null: false
    t.string "code", limit: 5, null: false
    t.string "locale", null: false
    t.string "image", limit: 64, null: false
    t.string "directory", limit: 32, null: false
    t.integer "sort_order", default: 0, null: false
    t.boolean "status", null: false
  end

  create_table "pp_layout", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "layout_id", null: false
    t.string "name", limit: 64, null: false
  end

  create_table "pp_layout_module", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "layout_module_id", null: false
    t.integer "layout_id", null: false
    t.string "code", limit: 64, null: false
    t.string "position", limit: 14, null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_layout_route", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "layout_route_id", null: false
    t.integer "layout_id", null: false
    t.integer "store_id", null: false
    t.string "route", limit: 64, null: false
  end

  create_table "pp_length_class", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "length_class_id", null: false
    t.decimal "value", precision: 15, scale: 8, null: false
  end

  create_table "pp_length_class_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "length_class_id", null: false
    t.integer "language_id", null: false
    t.string "title", limit: 32, null: false
    t.string "unit", limit: 4, null: false
  end

  create_table "pp_location", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "location_id", null: false
    t.string "name", limit: 32, null: false
    t.text "address", null: false
    t.string "telephone", limit: 32, null: false
    t.string "fax", limit: 32, null: false
    t.string "geocode", limit: 32, null: false
    t.string "image"
    t.text "open", null: false
    t.text "comment", null: false
  end

  create_table "pp_magasin", primary_key: "magasin_id", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 64, null: false
    t.string "image"
    t.integer "sort_order", null: false
    t.integer "country_id", null: false
    t.integer "zone_id", null: false
    t.integer "departement_id", null: false
    t.integer "city_id", null: false
    t.integer "district_id", null: false
    t.string "adresse", null: false
    t.integer "status", null: false
    t.integer "language_id", default: 1, null: false
    t.integer "viewed", null: false
    t.integer "points", default: 0, null: false
    t.date "date_available", null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_magasin_description", primary_key: "language_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "magasin_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.text "tag", null: false
    t.string "meta_title", null: false
    t.string "meta_description", null: false
    t.string "meta_keyword", null: false
  end

  create_table "pp_magasin_filter", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "magasin_id", null: false
    t.integer "filter_id", null: false
  end

  create_table "pp_magasin_image", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "magasin_image_id", null: false
    t.integer "magasin_id", null: false
    t.string "image"
    t.integer "sort_order", default: 0, null: false
  end

  create_table "pp_magasin_recurring", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "magasin_id", null: false
    t.integer "recurring_id", null: false
    t.integer "customer_group_id", null: false
  end

  create_table "pp_magasin_related", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "magasin_id", null: false
    t.integer "related_id", null: false
  end

  create_table "pp_magasin_reward", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "magasin_reward_id", null: false
    t.integer "magasin_id", default: 0, null: false
    t.integer "customer_group_id", default: 0, null: false
    t.integer "points", default: 0, null: false
  end

  create_table "pp_magasin_to_layout", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "magasin_id", null: false
    t.integer "store_id", null: false
    t.integer "layout_id", null: false
  end

  create_table "pp_manufacturer", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "manufacturer_id", null: false
    t.string "name", limit: 64, null: false
    t.integer "type", null: false
    t.string "image"
    t.integer "sort_order", null: false
    t.integer "cat"
  end

  create_table "pp_manufacturer_messages", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "manufacturer_message_id", null: false
    t.integer "manufacturer_id", null: false
    t.integer "affiliate_id", null: false
    t.string "name_fr", limit: 128, null: false
    t.string "name_en", limit: 128, null: false
    t.string "code", limit: 32, null: false
    t.boolean "status", default: true, null: false
    t.timestamp "date_add", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "pp_manufacturer_to_store", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "manufacturer_id", null: false
    t.integer "store_id", null: false
  end

  create_table "pp_manufacturer_type", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "manufacturer_type_id", null: false
    t.string "libellemanufacturer", limit: 60, null: false
  end

  create_table "pp_marche", primary_key: "marche_id", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 64, null: false
    t.string "image", default: "catalog/sans_image_marche.png"
    t.integer "sort_order", null: false
    t.integer "country_id", null: false
    t.integer "zone_id", null: false
    t.integer "city_id", null: false
    t.integer "departement_id", null: false
    t.integer "district_id", null: false
    t.string "adresse", null: false
    t.integer "status", null: false
    t.integer "type_id", null: false
    t.integer "language_id", default: 1, null: false
    t.integer "points", default: 0, null: false
    t.date "date_available"
    t.integer "viewed", default: 0, null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_marche_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "marche_id", null: false
    t.integer "language_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.text "tag", null: false
    t.string "meta_title", null: false
    t.string "meta_description", null: false
    t.string "meta_keyword", null: false
  end

  create_table "pp_marche_filter", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "marche_id", null: false
    t.integer "filter_id", null: false
  end

  create_table "pp_marche_image", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "marche_image_id", null: false
    t.integer "marche_id", null: false
    t.string "image"
    t.integer "sort_order", default: 0, null: false
  end

  create_table "pp_marche_recurring", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "marche_id", null: false
    t.integer "recurring_id", null: false
    t.integer "customer_group_id", null: false
  end

  create_table "pp_marche_related", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "marche_id", null: false
    t.integer "related_id", null: false
  end

  create_table "pp_marche_reward", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "marche_reward_id", null: false
    t.integer "marche_id", default: 0, null: false
    t.integer "customer_group_id", default: 0, null: false
    t.integer "points", default: 0, null: false
  end

  create_table "pp_marche_to_layout", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "marche_id", null: false
    t.integer "store_id", null: false
    t.integer "layout_id", null: false
  end

  create_table "pp_marche_type", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "type_id", null: false
    t.string "name", limit: 60, null: false
  end

  create_table "pp_marketing", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "marketing_id", null: false
    t.string "name", limit: 32, null: false
    t.text "description", null: false
    t.string "code", limit: 64, null: false
    t.integer "clicks", default: 0, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_marqueteur", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id_marqueteur", null: false
    t.string "name", limit: 60, null: false
    t.string "adresse", limit: 60, null: false
  end

  create_table "pp_menu", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "menu_id", null: false
    t.integer "store_id", null: false
    t.string "type", limit: 6, null: false
    t.string "link", null: false
    t.integer "sort_order", null: false
    t.boolean "status", null: false
  end

  create_table "pp_menu_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "menu_id", null: false
    t.integer "language_id", null: false
    t.string "name", limit: 64, null: false
  end

  create_table "pp_menu_module", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "menu_module_id", null: false
    t.integer "menu_id", null: false
    t.string "code", limit: 64, null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_messages", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "message_id", null: false
    t.integer "crossroads_id", null: false
    t.integer "affiliate_id", null: false
    t.string "name_fr", limit: 128, null: false
    t.string "name_en", limit: 128, null: false
    t.string "code", limit: 32, null: false
    t.boolean "status", default: true, null: false
    t.timestamp "date_add", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "image", limit: 256
  end

  create_table "pp_modification", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "modification_id", null: false
    t.string "name", limit: 64, null: false
    t.string "code", limit: 64, null: false
    t.string "author", limit: 64, null: false
    t.string "version", limit: 32, null: false
    t.string "link", null: false
    t.text "xml", limit: 16777215, null: false
    t.boolean "status", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_module", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "module_id", null: false
    t.string "name", limit: 64, null: false
    t.string "code", limit: 32, null: false
    t.text "setting", null: false
  end

  create_table "pp_news", primary_key: "news_id", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "image"
    t.integer "points", default: 0, null: false
    t.date "date_available", null: false
    t.integer "sort_order", default: 0, null: false
    t.boolean "status", default: false, null: false
    t.integer "viewed", default: 0, null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_news_description", primary_key: "news_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "language_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.text "tag", null: false
    t.string "meta_title", null: false
    t.string "meta_description", null: false
    t.string "meta_keyword", null: false
  end

  create_table "pp_news_filter", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "news_id", null: false
    t.integer "filter_id", null: false
  end

  create_table "pp_news_image", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "news_image_id", null: false
    t.integer "news_id", null: false
    t.string "image"
    t.integer "sort_order", default: 0, null: false
  end

  create_table "pp_news_recurring", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "news_id", null: false
    t.integer "recurring_id", null: false
    t.integer "customer_group_id", null: false
  end

  create_table "pp_news_related", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "news_id", null: false
    t.integer "related_id", null: false
  end

  create_table "pp_news_reward", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "news_reward_id", null: false
    t.integer "news_id", default: 0, null: false
    t.integer "customer_group_id", default: 0, null: false
    t.integer "points", default: 0, null: false
  end

  create_table "pp_news_to_layout", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "news_id", null: false
    t.integer "store_id", null: false
    t.integer "layout_id", null: false
  end

  create_table "pp_option", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "option_id", null: false
    t.string "type", limit: 32, null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_option_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "option_id", null: false
    t.integer "language_id", null: false
    t.string "name", limit: 128, null: false
  end

  create_table "pp_option_value", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "option_value_id", null: false
    t.integer "option_id", null: false
    t.string "image", null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_option_value_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "option_value_id", null: false
    t.integer "language_id", null: false
    t.integer "option_id", null: false
    t.string "name", limit: 128, null: false
  end

  create_table "pp_order", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "order_id", null: false
    t.integer "invoice_no", default: 0, null: false
    t.string "invoice_prefix", limit: 26, null: false
    t.integer "store_id", default: 0, null: false
    t.string "store_name", limit: 64, null: false
    t.string "store_url", null: false
    t.integer "customer_id", default: 0, null: false
    t.integer "customer_group_id", default: 0, null: false
    t.string "firstname", limit: 32, null: false
    t.string "lastname", limit: 32, null: false
    t.string "email", limit: 96, null: false
    t.string "telephone", limit: 32, null: false
    t.string "fax", limit: 32, null: false
    t.text "custom_field", null: false
    t.string "payment_firstname", limit: 32, null: false
    t.string "payment_lastname", limit: 32, null: false
    t.string "payment_company", limit: 60, null: false
    t.string "payment_address_1", limit: 128, null: false
    t.string "payment_address_2", limit: 128, null: false
    t.string "payment_city", limit: 128, null: false
    t.string "payment_postcode", limit: 10, null: false
    t.string "payment_country", limit: 128, null: false
    t.integer "payment_country_id", null: false
    t.string "payment_zone", limit: 128, null: false
    t.integer "payment_zone_id", null: false
    t.text "payment_address_format", null: false
    t.text "payment_custom_field", null: false
    t.string "payment_method", limit: 128, null: false
    t.string "payment_code", limit: 128, null: false
    t.string "shipping_firstname", limit: 32, null: false
    t.string "shipping_lastname", limit: 32, null: false
    t.string "shipping_company", limit: 40, null: false
    t.string "shipping_address_1", limit: 128, null: false
    t.string "shipping_address_2", limit: 128, null: false
    t.string "shipping_city", limit: 128, null: false
    t.string "shipping_postcode", limit: 10, null: false
    t.string "shipping_country", limit: 128, null: false
    t.integer "shipping_country_id", null: false
    t.string "shipping_zone", limit: 128, null: false
    t.integer "shipping_zone_id", null: false
    t.text "shipping_address_format", null: false
    t.text "shipping_custom_field", null: false
    t.string "shipping_method", limit: 128, null: false
    t.string "shipping_code", limit: 128, null: false
    t.text "comment", null: false
    t.decimal "total", precision: 15, scale: 4, default: "0.0", null: false
    t.integer "order_status_id", default: 0, null: false
    t.integer "affiliate_id", null: false
    t.decimal "commission", precision: 15, scale: 4, null: false
    t.integer "marketing_id", null: false
    t.string "tracking", limit: 64, null: false
    t.integer "language_id", null: false
    t.integer "currency_id", null: false
    t.string "currency_code", limit: 3, null: false
    t.decimal "currency_value", precision: 15, scale: 8, default: "1.0", null: false
    t.string "ip", limit: 40, null: false
    t.string "forwarded_ip", limit: 40, null: false
    t.string "user_agent", null: false
    t.string "accept_language", null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_order_custom_field", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "order_custom_field_id", null: false
    t.integer "order_id", null: false
    t.integer "custom_field_id", null: false
    t.integer "custom_field_value_id", null: false
    t.string "name", null: false
    t.text "value", null: false
    t.string "type", limit: 32, null: false
    t.string "location", limit: 16, null: false
  end

  create_table "pp_order_history", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "order_history_id", null: false
    t.integer "order_id", null: false
    t.integer "order_status_id", null: false
    t.boolean "notify", default: false, null: false
    t.text "comment", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_order_option", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "order_option_id", null: false
    t.integer "order_id", null: false
    t.integer "order_product_id", null: false
    t.integer "product_option_id", null: false
    t.integer "product_option_value_id", default: 0, null: false
    t.string "name", null: false
    t.text "value", null: false
    t.string "type", limit: 32, null: false
  end

  create_table "pp_order_product", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "order_product_id", null: false
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.string "name", null: false
    t.string "model", limit: 64, null: false
    t.integer "quantity", null: false
    t.decimal "price", precision: 15, scale: 4, default: "0.0", null: false
    t.decimal "total", precision: 15, scale: 4, default: "0.0", null: false
    t.decimal "tax", precision: 15, scale: 4, default: "0.0", null: false
    t.integer "reward", null: false
  end

  create_table "pp_order_recurring", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "order_recurring_id", null: false
    t.integer "order_id", null: false
    t.string "reference", null: false
    t.integer "product_id", null: false
    t.string "product_name", null: false
    t.integer "product_quantity", null: false
    t.integer "recurring_id", null: false
    t.string "recurring_name", null: false
    t.string "recurring_description", null: false
    t.string "recurring_frequency", limit: 25, null: false
    t.integer "recurring_cycle", limit: 2, null: false
    t.integer "recurring_duration", limit: 2, null: false
    t.decimal "recurring_price", precision: 10, scale: 4, null: false
    t.boolean "trial", null: false
    t.string "trial_frequency", limit: 25, null: false
    t.integer "trial_cycle", limit: 2, null: false
    t.integer "trial_duration", limit: 2, null: false
    t.decimal "trial_price", precision: 10, scale: 4, null: false
    t.integer "status", limit: 1, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_order_recurring_transaction", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "order_recurring_transaction_id", null: false
    t.integer "order_recurring_id", null: false
    t.string "reference", null: false
    t.string "type", null: false
    t.decimal "amount", precision: 10, scale: 4, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_order_status", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "order_status_id", null: false
    t.integer "language_id", null: false
    t.string "name", limit: 32, null: false
  end

  create_table "pp_order_total", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "order_total_id", null: false
    t.integer "order_id", null: false
    t.string "code", limit: 32, null: false
    t.string "title", null: false
    t.decimal "value", precision: 15, scale: 4, default: "0.0", null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_order_voucher", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "order_voucher_id", null: false
    t.integer "order_id", null: false
    t.integer "voucher_id", null: false
    t.string "description", null: false
    t.string "code", limit: 10, null: false
    t.string "from_name", limit: 64, null: false
    t.string "from_email", limit: 96, null: false
    t.string "to_name", limit: 64, null: false
    t.string "to_email", limit: 96, null: false
    t.integer "voucher_theme_id", null: false
    t.text "message", null: false
    t.decimal "amount", precision: 15, scale: 4, null: false
  end

  create_table "pp_paroisses", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "paroisse_id", null: false
    t.string "name", limit: 64, null: false
    t.string "image"
    t.integer "sort_order", null: false
  end

  create_table "pp_payment", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id", null: false
    t.string "operation", limit: 32
    t.string "canal", limit: 12, null: false
    t.string "status", limit: 64
    t.datetime "date_added"
    t.string "token", limit: 128
    t.string "phone_number", limit: 12
    t.integer "price"
    t.integer "customer_id"
    t.integer "crossroads_id"
    t.integer "city"
    t.datetime "date_updated"
  end

  create_table "pp_phone_validation", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id", null: false
    t.string "phone_number", limit: 12, null: false
    t.string "code", limit: 6, null: false
    t.datetime "date_added", null: false
    t.datetime "date_validation"
  end

  create_table "pp_postes", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "poste_id", null: false
    t.string "name", limit: 64, null: false
    t.string "image"
    t.integer "sort_order", null: false
  end

  create_table "pp_presbyteriats", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "presbyteriat_id", null: false
    t.integer "synode_id", null: false
    t.string "name", limit: 64, null: false
  end

  create_table "pp_product", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id", null: false
    t.string "model", limit: 64, null: false
    t.string "sku", limit: 64, null: false
    t.string "upc", limit: 12, null: false
    t.string "ean", limit: 14, null: false
    t.string "jan", limit: 13, null: false
    t.string "isbn", limit: 17, null: false
    t.string "mpn", limit: 64, null: false
    t.string "location", limit: 128, null: false
    t.integer "quantity", default: 0, null: false
    t.integer "stock_status_id", null: false
    t.string "image"
    t.integer "manufacturer_id", null: false
    t.integer "affiliate_id", null: false
    t.boolean "shipping", default: true, null: false
    t.decimal "price", precision: 15, scale: 4, default: "0.0", null: false
    t.integer "points", default: 0, null: false
    t.integer "tax_class_id", null: false
    t.date "date_available", null: false
    t.decimal "weight", precision: 15, scale: 8, default: "0.0", null: false
    t.integer "weight_class_id", default: 0, null: false
    t.decimal "length", precision: 15, scale: 8, default: "0.0", null: false
    t.decimal "width", precision: 15, scale: 8, default: "0.0", null: false
    t.decimal "height", precision: 15, scale: 8, default: "0.0", null: false
    t.integer "length_class_id", default: 0, null: false
    t.boolean "subtract", default: true, null: false
    t.integer "minimum", default: 1, null: false
    t.integer "sort_order", default: 0, null: false
    t.boolean "status", default: false, null: false
    t.integer "viewed", default: 0, null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_product_attribute", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id", null: false
    t.integer "attribute_id", null: false
    t.integer "language_id", null: false
    t.text "text", null: false
  end

  create_table "pp_product_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id", null: false
    t.integer "language_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.text "tag", null: false
    t.string "meta_title", null: false
    t.string "meta_description", null: false
    t.string "meta_keyword", null: false
  end

  create_table "pp_product_discount", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_discount_id", null: false
    t.integer "product_id", null: false
    t.integer "customer_group_id", null: false
    t.integer "quantity", default: 0, null: false
    t.integer "priority", default: 1, null: false
    t.decimal "price", precision: 15, scale: 4, default: "0.0", null: false
    t.date "date_start", null: false
    t.date "date_end", null: false
  end

  create_table "pp_product_filter", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id", null: false
    t.integer "filter_id", null: false
  end

  create_table "pp_product_image", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_image_id", null: false
    t.integer "product_id", null: false
    t.string "image"
    t.integer "sort_order", default: 0, null: false
  end

  create_table "pp_product_magasin", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "product_magasin_id", null: false
    t.integer "product_id", null: false
    t.integer "magasin_id", null: false
    t.integer "category_id", null: false
    t.integer "quantite", null: false
    t.timestamp "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "date_fin", null: false
  end

  create_table "pp_product_marche", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "product_marche_id", null: false
    t.integer "product_id", null: false
    t.integer "marche_id", null: false
    t.integer "category_id", null: false
    t.integer "quantite", null: false
    t.timestamp "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "date_fin", null: false
  end

  create_table "pp_product_option", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_option_id", null: false
    t.integer "product_id", null: false
    t.integer "option_id", null: false
    t.text "value", null: false
    t.boolean "required", null: false
  end

  create_table "pp_product_option_value", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_option_value_id", null: false
    t.integer "product_option_id", null: false
    t.integer "product_id", null: false
    t.integer "option_id", null: false
    t.integer "option_value_id", null: false
    t.integer "quantity", null: false
    t.boolean "subtract", null: false
    t.decimal "price", precision: 15, scale: 4, null: false
    t.string "price_prefix", limit: 1, null: false
    t.integer "points", null: false
    t.string "points_prefix", limit: 1, null: false
    t.decimal "weight", precision: 15, scale: 8, null: false
    t.string "weight_prefix", limit: 1, null: false
  end

  create_table "pp_product_price", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_price_id", null: false
    t.integer "product_id", null: false
    t.integer "price", default: 0, null: false
    t.timestamp "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "date_fin", null: false
  end

  create_table "pp_product_recurring", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id", null: false
    t.integer "recurring_id", null: false
    t.integer "customer_group_id", null: false
  end

  create_table "pp_product_related", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id", null: false
    t.integer "related_id", null: false
  end

  create_table "pp_product_reward", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_reward_id", null: false
    t.integer "product_id", default: 0, null: false
    t.integer "customer_group_id", default: 0, null: false
    t.integer "points", default: 0, null: false
  end

  create_table "pp_product_special", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_special_id", null: false
    t.integer "product_id", null: false
    t.integer "customer_group_id", null: false
    t.integer "priority", default: 1, null: false
    t.decimal "price", precision: 15, scale: 4, default: "0.0", null: false
    t.date "date_start", null: false
    t.date "date_end", null: false
  end

  create_table "pp_product_to_category", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id", null: false
    t.integer "category_id", null: false
  end

  create_table "pp_product_to_download", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id", null: false
    t.integer "download_id", null: false
  end

  create_table "pp_product_to_layout", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id", null: false
    t.integer "store_id", null: false
    t.integer "layout_id", null: false
  end

  create_table "pp_product_to_store", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id", null: false
    t.integer "store_id", default: 0, null: false
  end

  create_table "pp_program", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "program_id", null: false
    t.integer "marche_id", null: false
    t.timestamp "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "date_fin", null: false
  end

  create_table "pp_program_m", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "program_id", null: false
    t.integer "magasin_id", null: false
    t.timestamp "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "date_fin", null: false
  end

  create_table "pp_recurring", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "recurring_id", null: false
    t.decimal "price", precision: 10, scale: 4, null: false
    t.string "frequency", limit: 10, null: false
    t.integer "duration", null: false, unsigned: true
    t.integer "cycle", null: false, unsigned: true
    t.integer "trial_status", limit: 1, null: false
    t.decimal "trial_price", precision: 10, scale: 4, null: false
    t.string "trial_frequency", limit: 10, null: false
    t.integer "trial_duration", null: false, unsigned: true
    t.integer "trial_cycle", null: false, unsigned: true
    t.integer "status", limit: 1, null: false
    t.integer "sort_order", null: false
  end

  create_table "pp_recurring_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "recurring_id", null: false
    t.integer "language_id", null: false
    t.string "name", null: false
  end

  create_table "pp_return", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "return_id", null: false
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "customer_id", null: false
    t.string "firstname", limit: 32, null: false
    t.string "lastname", limit: 32, null: false
    t.string "email", limit: 96, null: false
    t.string "telephone", limit: 32, null: false
    t.string "product", null: false
    t.string "model", limit: 64, null: false
    t.integer "quantity", null: false
    t.boolean "opened", null: false
    t.integer "return_reason_id", null: false
    t.integer "return_action_id", null: false
    t.integer "return_status_id", null: false
    t.text "comment"
    t.date "date_ordered", null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_return_action", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "return_action_id", null: false
    t.integer "language_id", default: 0, null: false
    t.string "name", limit: 64, null: false
  end

  create_table "pp_return_history", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "return_history_id", null: false
    t.integer "return_id", null: false
    t.integer "return_status_id", null: false
    t.boolean "notify", null: false
    t.text "comment", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_return_reason", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "return_reason_id", null: false
    t.integer "language_id", default: 0, null: false
    t.string "name", limit: 128, null: false
  end

  create_table "pp_return_status", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "return_status_id", null: false
    t.integer "language_id", default: 0, null: false
    t.string "name", limit: 32, null: false
  end

  create_table "pp_review", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "review_id", null: false
    t.integer "product_id", null: false
    t.integer "customer_id", null: false
    t.string "author", limit: 64, null: false
    t.text "text", null: false
    t.integer "rating", null: false
    t.boolean "status", default: false, null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_review_magasin", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "review_id", null: false
    t.integer "magasin_id", null: false
    t.integer "customer_id", null: false
    t.string "author", limit: 64, null: false
    t.text "text", null: false
    t.integer "rating", null: false
    t.boolean "status", default: false, null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_services", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "service_id", null: false
    t.string "name", limit: 128, null: false
    t.string "code", limit: 32, null: false
    t.boolean "status", default: true, null: false
  end

  create_table "pp_setting", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "setting_id", null: false
    t.integer "store_id", default: 0, null: false
    t.string "code", limit: 32, null: false
    t.string "key", limit: 64, null: false
    t.text "value", null: false
    t.boolean "serialized", null: false
  end

  create_table "pp_souhaits", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "souhait_id", null: false
    t.integer "marche_id", null: false
    t.integer "customer_id", null: false
    t.integer "product_id", null: false
    t.integer "service_id", null: false
    t.integer "unite_id", null: false
    t.integer "qte", null: false
    t.timestamp "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "date_fin", null: false
    t.string "session", limit: 1500, null: false
  end

  create_table "pp_specialites", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "specialite_id", null: false
    t.string "name", limit: 64, null: false
  end

  create_table "pp_stock_status", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "stock_status_id", null: false
    t.integer "language_id", null: false
    t.string "name", limit: 32, null: false
  end

  create_table "pp_store", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "store_id", null: false
    t.string "name", limit: 64, null: false
    t.string "url", null: false
    t.string "ssl", null: false
  end

  create_table "pp_synodes", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "synode_id", null: false
    t.string "name", limit: 64, null: false
    t.string "image"
    t.integer "sort_order", null: false
  end

  create_table "pp_tax_class", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "tax_class_id", null: false
    t.string "title", limit: 32, null: false
    t.string "description", null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_tax_rate", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "tax_rate_id", null: false
    t.integer "geo_zone_id", default: 0, null: false
    t.string "name", limit: 32, null: false
    t.decimal "rate", precision: 15, scale: 4, default: "0.0", null: false
    t.string "type", limit: 1, null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "pp_tax_rate_to_customer_group", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "tax_rate_id", null: false
    t.integer "customer_group_id", null: false
  end

  create_table "pp_tax_rule", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "tax_rule_id", null: false
    t.integer "tax_class_id", null: false
    t.integer "tax_rate_id", null: false
    t.string "based", limit: 10, null: false
    t.integer "priority", default: 1, null: false
  end

  create_table "pp_theme", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "theme_id", null: false
    t.integer "store_id", null: false
    t.string "theme", limit: 64, null: false
    t.string "route", limit: 64, null: false
    t.text "code", null: false
  end

  create_table "pp_token", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "token_id", null: false
    t.datetime "date_token", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "token", limit: 32, null: false
  end

  create_table "pp_transaction", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "transaction_id", null: false
    t.string "transaction", limit: 128, null: false
  end

  create_table "pp_translation", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "translation_id", null: false
    t.integer "store_id", null: false
    t.integer "language_id", null: false
    t.string "route", limit: 64, null: false
    t.string "key", limit: 64, null: false
    t.text "value", null: false
  end

  create_table "pp_unites", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "unite_id", null: false
    t.integer "product_id", null: false
    t.integer "language_id", null: false
    t.string "name", limit: 235, null: false
  end

  create_table "pp_upload", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "upload_id", null: false
    t.string "name", null: false
    t.string "filename", null: false
    t.string "code", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_url_alias", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "url_alias_id", null: false
    t.string "query", null: false
    t.string "keyword", null: false
  end

  create_table "pp_user", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.integer "user_group_id", null: false
    t.string "username", limit: 20, null: false
    t.string "password", limit: 40, null: false
    t.string "salt", limit: 9, null: false
    t.string "firstname", limit: 32, null: false
    t.string "lastname", limit: 32, null: false
    t.string "email", limit: 96, null: false
    t.string "image", null: false
    t.string "code", limit: 40, null: false
    t.string "ip", limit: 40, null: false
    t.boolean "status", null: false
    t.datetime "date_added", null: false
    t.string "phone_number", limit: 30, null: false
  end

  create_table "pp_user_group", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "user_group_id", null: false
    t.string "name", limit: 64, null: false
    t.text "permission", null: false
  end

  create_table "pp_user_magasin", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_magasin_id", null: false
    t.integer "magasin_id", null: false
    t.integer "user_id", null: false
    t.timestamp "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "date_fin", null: false
  end

  create_table "pp_user_market", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_mache_id", null: false
    t.integer "marche_id", null: false
    t.integer "user_id", null: false
    t.timestamp "date_deb", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "date_fin", null: false
  end

  create_table "pp_voucher", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "voucher_id", null: false
    t.integer "order_id", null: false
    t.string "code", limit: 10, null: false
    t.string "from_name", limit: 64, null: false
    t.string "from_email", limit: 96, null: false
    t.string "to_name", limit: 64, null: false
    t.string "to_email", limit: 96, null: false
    t.integer "voucher_theme_id", null: false
    t.text "message", null: false
    t.decimal "amount", precision: 15, scale: 4, null: false
    t.boolean "status", null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_voucher_history", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "voucher_history_id", null: false
    t.integer "voucher_id", null: false
    t.integer "order_id", null: false
    t.decimal "amount", precision: 15, scale: 4, null: false
    t.datetime "date_added", null: false
  end

  create_table "pp_voucher_theme", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "voucher_theme_id", null: false
    t.string "image", null: false
  end

  create_table "pp_voucher_theme_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "voucher_theme_id", null: false
    t.integer "language_id", null: false
    t.string "name", limit: 32, null: false
  end

  create_table "pp_wayout", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "crossroads_id", null: false
    t.integer "crossroadss_id", null: false
  end

  create_table "pp_weight_class", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "weight_class_id", null: false
    t.decimal "value", precision: 15, scale: 8, default: "0.0", null: false
  end

  create_table "pp_weight_class_description", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "weight_class_id", null: false
    t.integer "language_id", null: false
    t.string "title", limit: 32, null: false
    t.string "unit", limit: 4, null: false
  end

  create_table "pp_zone", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "zone_id", null: false
    t.integer "country_id", null: false
    t.string "name", limit: 128, null: false
    t.string "code", limit: 32, null: false
    t.boolean "status", default: true, null: false
    t.integer "language_id", default: 1, null: false
  end

  create_table "pp_zone_to_geo_zone", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "zone_to_geo_zone_id", null: false
    t.integer "country_id", null: false
    t.integer "zone_id", default: 0, null: false
    t.integer "geo_zone_id", null: false
    t.datetime "date_added", null: false
    t.datetime "date_modified", null: false
  end

  create_table "produits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "prix"
    t.string "quantite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "variete_id"
    t.string "photo"
    t.bigint "market_id"
    t.index ["market_id"], name: "index_produits_on_market_id"
    t.index ["variete_id"], name: "index_produits_on_variete_id"
  end

  create_table "quartiers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.bigint "arrondissement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrondissement_id"], name: "index_quartiers_on_arrondissement_id"
  end

  create_table "souhaits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "varietes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vils", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "arrondissements", "vils"
  add_foreign_key "markets", "quartiers"
  add_foreign_key "markets", "types"
  add_foreign_key "produits", "markets"
  add_foreign_key "produits", "varietes"
  add_foreign_key "quartiers", "arrondissements"
end
