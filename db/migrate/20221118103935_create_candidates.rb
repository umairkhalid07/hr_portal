class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.text :bio
      t.string :university
      t.float :gpa

      t.timestamps
    end
  end
end
