class PpMarche < ActiveRecord::Base
  establish_connection :production
  self.table_name = "pp_marche"
end
