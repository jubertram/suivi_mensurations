class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements do |t|
      t.date :date
      t.integer :weight
      t.integer :bras
      t.integer :poitrine
      t.integer :taille
      t.integer :hanches
      t.integer :cuisses
      t.integer :epaules
      t.integer :mollets
      t.integer :glucides
      t.string :photo

      t.timestamps
    end
  end
end
