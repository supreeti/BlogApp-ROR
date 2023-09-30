class Createposts < ActiveRecord::Migration[7.0]
  def change
    create_table :post do |t|
      t.string :title
      t.text :text
      t.integer :comment_counter, default: 0
      t.integer :like_counter, default: 0
<<<<<<< HEAD
      t.references :author, foreign_key: { to_table: :user } 
      
=======
      t.references :author, foreign_key: { to_table: :users }       
>>>>>>> 4d3634e1b070c18915427b2a391e0308531e0e5f
      t.timestamps
    end
  end
end
