class CreateByLines < ActiveRecord::Migration[8.0]
  def change
    create_table :by_lines do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
