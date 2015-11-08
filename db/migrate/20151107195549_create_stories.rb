class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.references :user
      t.references :tag
      t.integer :created_at, null: false
      t.integer :updated_at, null: false
      t.boolean :private, default: false
      t.integer :vote, default: 0
    end
  end
end
