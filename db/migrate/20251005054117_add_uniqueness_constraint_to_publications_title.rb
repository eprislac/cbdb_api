class AddUniquenessConstraintToPublicationsTitle < ActiveRecord::Migration[8.0]
  def change
    add_index :publications, :title, unique: true
  end
end
