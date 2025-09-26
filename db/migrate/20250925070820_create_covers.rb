class CreateCovers < ActiveRecord::Migration[8.0]
  def change
    create_table :covers do |t|
      t.string :variant
      t.references :issue, null: false, foreign_key: true
      t.string :img_url

      t.timestamps
    end
  end
end
