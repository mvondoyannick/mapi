class PpCity < ActiveRecord::Base
  establish_connection :production
  self.table_name = "pp_city"
end

