class PpProgram < ActiveRecord::Base
  establish_connection :production
  self.table_name = "pp_program"
end
