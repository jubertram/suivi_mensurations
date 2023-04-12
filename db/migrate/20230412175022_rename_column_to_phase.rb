class RenameColumnToPhase < ActiveRecord::Migration[7.0]
  def change
    rename_column :phases, :type, :phase_type
  end
end
