class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :link
      t.text :body, null: false
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
