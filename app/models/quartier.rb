class Quartier < ApplicationRecord
  belongs_to 	:arrondissement
  has_many 		:market
end
