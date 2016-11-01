class CreateIsolates < ActiveRecord::Migration[5.0]
  def change
    create_table :isolates do |t|
      t.references :antibiogram, foreign_key: true
      t.references :bacterium, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
