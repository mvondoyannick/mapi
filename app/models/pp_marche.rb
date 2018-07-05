class PpMarche < ActiveRecord::Base
  establish_connection :development
  self.table_name = "pp_marche"
end
