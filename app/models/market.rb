class Market < ApplicationRecord
  belongs_to :quartier
  belongs_to :type
  has_many :produit
  has_and_belongs_to_many :calendriers
  validates_presence_of :name, presence: true
  validates_presence_of :debut, presence: true 
  validates_presence_of :fin, presence: true 
end
