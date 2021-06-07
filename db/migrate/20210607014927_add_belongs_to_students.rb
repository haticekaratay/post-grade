class AddBelongsToStudents < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :students, :teacher, null: false, foreign_key: true
  end
end
