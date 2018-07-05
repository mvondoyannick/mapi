class Calendrier < ApplicationRecord
	has_and_belongs_to_many :markets
	validates_presence_of :date, presence: true
end
