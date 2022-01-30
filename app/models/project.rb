class Project < ApplicationRecord

  has_many :tasks
  
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :tasks, reject_if: :all_blank

  # def percentage_tasks_complete
  #   total_tasks = project.tasks
  #   complete_tasks = project.tasks.

    
  # end
  
end
