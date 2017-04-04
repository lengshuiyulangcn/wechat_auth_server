class AddStartAtAndEndAtToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :start_at, :datetime, default: DateTime.now
    add_column :users, :end_at, :datetime, default: DateTime.tomorrow
  end
end
