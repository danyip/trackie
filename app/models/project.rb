class Project < ApplicationRecord

  has_many :tasks, dependent: :destroy
  
  belongs_to :user

  accepts_nested_attributes_for :tasks, reject_if: :all_blank

  validates :title, length: {minimum: 2}

  enum priority: [:Urgent, :High, :Medium, :Low]

  # Calculates and returns a percentage based on how many tasks are complete
  def calc_project_completion
      num_all_tasks = tasks.count.to_f
      num_complete_tasks = tasks.where(status: "Complete").count.to_f
      ((num_complete_tasks / num_all_tasks)*100).round
  end

  
end
