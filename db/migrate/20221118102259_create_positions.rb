class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.datetime :started_at, null: false
      t.datetime :ends_at, null: false
      t.integer :vacancies, null: false

      t.timestamps
    end
  end
end
