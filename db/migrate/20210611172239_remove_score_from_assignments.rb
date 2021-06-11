class RemoveScoreFromAssignments < ActiveRecord::Migration[6.1]
  def change
    remove_column :assignments , :score, :integer
  end
end
