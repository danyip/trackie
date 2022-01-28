class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :duration
      t.date :due_date
      t.integer :status
      t.integer :priority
      t.integer :project_id

      t.timestamps
    end
  end
end
