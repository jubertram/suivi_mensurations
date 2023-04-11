class CreatePhases < ActiveRecord::Migration[7.0]
  def change
    create_table :phases do |t|
      t.string :type
      t.date :started_date
      t.date :ended_date
      t.integer :period
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
