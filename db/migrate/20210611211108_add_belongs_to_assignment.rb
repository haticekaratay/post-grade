class AddBelongsToAssignment < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :assignments, :course, foreign_key: true
  end
end
