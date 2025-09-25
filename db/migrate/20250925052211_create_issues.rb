class CreateIssues < ActiveRecord::Migration[8.0]
  def change
    create_table :issues do |t|
      t.integer :number
      t.integer :legacy_number
      t.datetime :cover_date
      t.references :publication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
