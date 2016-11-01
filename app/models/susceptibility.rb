class Susceptibility < ApplicationRecord
	belongs_to :antibiogram
	belongs_to :bacterium
	belongs_to :drug
end
