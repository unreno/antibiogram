class CreateAntibiograms < ActiveRecord::Migration[5.0]
	def change
		create_table :antibiograms do |t|
			t.string :name

			t.timestamps
		end
	end
end
