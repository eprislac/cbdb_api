class AddNotNullToPublicationTypeName < ActiveRecord::Migration[8.0]
  def change
    change_column_null :publication_types, :name, false
  end
end
