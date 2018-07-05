class PpCity < ActiveRecord::Base
  establish_connection :development
  self.table_name = "pp_city"
end

