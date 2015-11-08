class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.references :story
      t.references :user
      t.text :content
      t.integer :created_at, null: false 
      t.integer :updated_at, null: false 
    end
  end
end
