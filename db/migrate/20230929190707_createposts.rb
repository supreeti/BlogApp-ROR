class Createposts < ActiveRecord::Migration[7.0]
  def change
    create_table :post do |t|
      t.string :title
      t.text :text
      t.integer :comment_counter, default: 0
      t.integer :like_counter, default: 0
      t.references :author, foreign_key: { to_table: :user } 
      
      t.timestamps
    end
  end
end
