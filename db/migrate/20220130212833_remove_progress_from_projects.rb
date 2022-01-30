class RemoveProgressFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :progress, :integer
  end
end
