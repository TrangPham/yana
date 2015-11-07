class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :v_count
      t.integer :created_at, null: false 
      t.integer :updated_at, null: false 
    end
  end
end
