class AddUniqueToPublicationTypeName < ActiveRecord::Migration[8.0]
  def change
    add_index :publication_types, :name, unique: true
  end
end
