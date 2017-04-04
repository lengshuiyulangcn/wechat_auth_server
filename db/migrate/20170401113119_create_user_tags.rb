class CreateUserTags < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tags do |t|
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
      add_index :user_tags, [:user_id, :tag_id], :unique => true
  end
end
