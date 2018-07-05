class PpProduct < ActiveRecord::Base
  establish_connection :development
  self.table_name = "pp_product"
end
