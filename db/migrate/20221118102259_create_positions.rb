class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.datetime :date_starts_at, null: false
      t.datetime :date_ends_at, null: false
      t.integer :number_of_positions, null: false

      t.timestamps
    end
  end
end
