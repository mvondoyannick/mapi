class PpProductMarche < ActiveRecord::Base
  establish_connection :production
  self.table_name = "pp_product_marche"
end
