class AddNameToCollections < ActiveRecord::Migration[8.0]
  def change
    add_column :collections, :name, :string, null: false
    add_index :collections, :name, unique: true
  end
end
