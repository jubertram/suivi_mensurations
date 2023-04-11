class AddSizeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :size, :integer
    add_column :users, :weight, :integer
    add_column :users, :photo_profile, :string
  end
end
