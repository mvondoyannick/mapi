class PpMagasin < ActiveRecord::Base
  establish_connection :production
  self.table_name = "pp_magasin"
end
