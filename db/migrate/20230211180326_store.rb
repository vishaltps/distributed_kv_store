class Store < ActiveRecord::Migration[7.0]
  def change
    create_table :stores, id: false, primary_key: :key do |t|
      t.string :key, null: false
      t.text :values
      t.integer :ttl, null: false
    end

    add_index :stores, :key, unique: true
    add_index :stores, :ttl
  end
end
