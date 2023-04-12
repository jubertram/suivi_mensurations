class CreatePhases < ActiveRecord::Migration[7.0]
  def change
    create_table :phases do |t|
      t.string :type
      t.references :user, null: false, foreign_key: true
      t.date :started_date
      t.date :ended_date
      t.integer :period

      t.timestamps
    end
  end
end
