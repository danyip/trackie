class Task < ApplicationRecord

  belongs_to :project

  belongs_to :user, optional: true

  validates :title, length: {minimum: 2}
  validates :project, presence: true

  enum status: [:Complete, :"In Progress", :"On Hold", :Assigned, :Unassigned ]
  enum priority: [:Urgent, :High, :Medium, :Low]

  # this method updates the task status based on if there is a user assigned or not and if a status has been set.
  def update_task_status 

    # when a task has no user assigned, the status should be "Unassigned"
    if !user_id 
      update status: "Unassigned"
      
    # when a task has a user, and there is no status set, or it is "Unassigned" it should be updated to "Assigned"
    elsif !status || status == "Unassigned"
      update status: "Assigned"
    
    end # end if

  end # update_task_status

end
