class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :created_at, null: false 
      t.integer :updated_at, null: false 
    end
  end
end
