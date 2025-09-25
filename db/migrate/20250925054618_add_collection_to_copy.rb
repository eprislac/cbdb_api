class AddCollectionToCopy < ActiveRecord::Migration[8.0]
  def change
    add_reference :copies, :collection, null: false, foreign_key: true
  end
end
