class AddStatusToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :status, :integer, null: false
  end
end
