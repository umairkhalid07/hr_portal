class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :name
      t.text :description
      t.datetime :deadline
      t.integer :available

      t.timestamps
    end
  end
end
