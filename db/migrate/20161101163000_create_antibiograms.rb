class CreateAntibiograms < ActiveRecord::Migration[5.0]
	def change
		create_table :antibiograms do |t|

			t.timestamps
		end
	end
end
