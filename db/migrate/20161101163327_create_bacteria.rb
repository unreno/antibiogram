class CreateBacteria < ActiveRecord::Migration[5.0]
	def change
		create_table :bacteria do |t|
			t.string :name

			t.timestamps
		end
	end
end
