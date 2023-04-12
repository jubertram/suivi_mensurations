class AddMigrationToMeasurements < ActiveRecord::Migration[7.0]
  def change
    add_reference :measurements, :phase, index:true
  end
end
