class CreateSusceptibilities < ActiveRecord::Migration[5.0]
  def change
    create_table :susceptibilities do |t|
      t.references :isolate, foreign_key: true
      t.references :drug, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
