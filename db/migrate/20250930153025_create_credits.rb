class CreateCredits < ActiveRecord::Migration[8.0]
  def change
    create_table :credits do |t|
      t.references :by_line, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: true
      t.references :issue, null: false, foreign_key: true
      t.references :cover, foreign_key: true
      t.timestamps
    end
  end
end
