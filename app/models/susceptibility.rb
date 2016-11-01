class Susceptibility < ApplicationRecord
	belongs_to :antibiogram
	belongs_to :species
	belongs_to :drug
end
