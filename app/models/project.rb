class Project < ApplicationRecord

  has_many :tasks
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :tasks, reject_if: :all_blank

  validates :title, length: {minimum: 2}

  enum priority: [:Urgent, :High, :Medium, :Low]

  def calc_project_completion

      num_all_tasks = tasks.count.to_f
      num_complete_tasks = tasks.where(status: "Complete").count.to_f
      ((num_complete_tasks / num_all_tasks)*100).round
    
  end
  
end
