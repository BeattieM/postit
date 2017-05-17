class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :uuid, null: false
      t.belongs_to :user, index: true
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps null: false
      t.datetime :deleted_at
    end
    add_index :posts, :deleted_at
  end
end
