class Createlikes < ActiveRecord::Migration[7.0]
  def change
    create_table :like do |t|
      t.references :user, null: false, foreign_key: true
<<<<<<< HEAD:db/migrate/20230930131737_createlikes.rb
      t.references :post, null: false, foreign_key: true
=======
      t.references :post, null: false, foreign_key: true  
>>>>>>> 4d3634e1b070c18915427b2a391e0308531e0e5f:db/migrate/20230929190639_createlikes.rb
      t.timestamps
  end
end
