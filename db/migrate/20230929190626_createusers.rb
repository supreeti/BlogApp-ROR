class Createusers < ActiveRecord::Migration[7.0]
  def change
    create_table :user do |t|
      t.string :name
      t.string :photo
      t.string :bio
      t.integer :post_counter, default: 0
      
      t.timestamps
    end
  end
end
