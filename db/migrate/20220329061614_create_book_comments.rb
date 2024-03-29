class CreateBookComments < ActiveRecord::Migration[6.1]
  def change
    create_table :book_comments do |t|
      t.text :comment, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :book_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
