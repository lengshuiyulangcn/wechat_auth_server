class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :avatar_url
      t.string :open_id
      t.string :session_id

      t.timestamps
    end
  end
end
