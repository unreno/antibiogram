class Isolate < ApplicationRecord
	belongs_to :antibiogram
	belongs_to :bacterium
	has_many :susceptibilities, :dependent => :destroy
end
