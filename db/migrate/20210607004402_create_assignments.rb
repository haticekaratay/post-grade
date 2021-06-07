class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :description
      t.datetime :due_date
      t.integer :score
      t.string :type

      t.timestamps
    end
  end
end
