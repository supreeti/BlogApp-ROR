class Createcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
<<<<<<< HEAD
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
=======
      t.references :user, null: false
      t.references :post, null: false
>>>>>>> 0183b13f8a0d76e7cffe7bc4605403421272026f
      t.text :text  
      t.timestamps
    end
  end
end
