class CreateSusceptibilities < ActiveRecord::Migration[5.0]
	def change
		create_table :susceptibilities do |t|
			t.references :antibiogram, foreign_key: true
			t.references :species, foreign_key: true
			t.references :drug, foreign_key: true
			t.integer :isolate
			t.integer :value

			t.timestamps
		end
	end
end
