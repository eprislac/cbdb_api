class AddCoverToCopy < ActiveRecord::Migration[8.0]
  def change
    add_reference :copies, :cover, null: false, foreign_key: true
  end
end
