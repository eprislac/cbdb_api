class CreateCopies < ActiveRecord::Migration[8.0]
  def change
    create_table :copies do |t|
      t.references :issue, null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
