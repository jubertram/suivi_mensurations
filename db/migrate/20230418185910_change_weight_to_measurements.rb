class ChangeWeightToMeasurements < ActiveRecord::Migration[7.0]
  def change
    change_column :measurements, :weight, :float
    change_column :measurements, :bras, :float
    change_column :measurements, :poitrine, :float
    change_column :measurements, :taille, :float
    change_column :measurements, :hanches, :float
    change_column :measurements, :cuisses, :float
    change_column :measurements, :epaules, :float
    change_column :measurements, :mollets, :float
  end
end
