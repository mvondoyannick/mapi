class PpProgram < ActiveRecord::Base
  establish_connection :development
  self.table_name = "pp_program"
end