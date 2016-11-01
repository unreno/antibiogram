class Susceptibility < ApplicationRecord
  belongs_to :isolate
  belongs_to :drug
end
