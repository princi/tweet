class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :rate_id
      t.integer :unrate_id

      t.timestamps null: false
    end
  end
end
