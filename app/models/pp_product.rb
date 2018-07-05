class PpProduct < ActiveRecord::Base
  establish_connection :production
  self.table_name = "pp_product"
end
