class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :grade_level
      t.datetime :birthday
      t.string :gender

      t.timestamps
    end
  end
end
