class RemoveDurationFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :duration, :integer
  end
end
