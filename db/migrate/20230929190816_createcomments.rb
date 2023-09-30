class Createcomments < ActiveRecord::Migration[7.0]
  def change
<<<<<<< HEAD
    create_table :comment do |t|
      t.references :user, null: false, foreign_key: true
      t.references :posts, foreign_key: true
      t.text :text
      
=======
    create_table :comments do |t|
<<<<<<< HEAD
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
=======
      t.references :user, null: false
      t.references :post, null: false
>>>>>>> 0183b13f8a0d76e7cffe7bc4605403421272026f
      t.text :text  
>>>>>>> 4d3634e1b070c18915427b2a391e0308531e0e5f
      t.timestamps
    end
  end
end
