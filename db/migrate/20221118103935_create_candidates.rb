class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :phone_number, null: false
      t.text :bio, null: false
      t.string :university, null: false
      t.float :gpa, null: false
      t.references :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
