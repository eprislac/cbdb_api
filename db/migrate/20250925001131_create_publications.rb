class CreatePublications < ActiveRecord::Migration[8.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.integer :start_date
      t.integer :end_date
      t.integer :volume
      t.references :publication_type, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
