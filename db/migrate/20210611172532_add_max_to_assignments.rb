class AddMaxToAssignments < ActiveRecord::Migration[6.1]
  def change
    add_column :assignments, :max, :integer
  end
end
