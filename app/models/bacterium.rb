class Bacterium < ApplicationRecord
	has_many :isolates
#	has_many :antibiograms, :through => :isolates
	has_many :susceptibilities, :through => :isolates
end
