class AddStartAtAndEndAtToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :start_at, :datetime
    add_column :users, :end_at, :datetime
  end
end
