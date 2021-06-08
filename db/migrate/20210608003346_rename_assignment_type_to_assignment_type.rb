class RenameAssignmentTypeToAssignmentType < ActiveRecord::Migration[6.1]
  def change
    rename_column :assignments, :type, :assignment_type
  end
end
