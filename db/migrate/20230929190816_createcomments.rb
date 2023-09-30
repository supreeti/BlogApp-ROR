class Createcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :comment do |t|
      t.references :user, null: false, foreign_key: true
      t.references :posts, foreign_key: true
      t.text :text
      
      t.timestamps
    end
  end
end
