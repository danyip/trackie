class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :priority

      t.timestamps
    end
  end
end
