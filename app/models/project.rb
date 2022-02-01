class Project < ApplicationRecord

  has_many :tasks
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :tasks, reject_if: :all_blank

  validates :title, length: {minimum: 2}

  enum priority: [:Urgent, :High, :Medium, :Low]

  # def calc_project_completion

  #     # num_all_tasks = tasks.count.to_f
  #     # complete_tasks = tasks.where status: "Complete"
  #     # num_complete_tasks = complete_tasks.count.to_f
     
      
  #     ((tasks.where status: "Complete".count.to_f)/(tasks.count.to_f)*100).round
  #   #  p ((num_complete_tasks / num_all_tasks)*100).round
    
  # end
  
end
