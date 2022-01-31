class Task < ApplicationRecord

  belongs_to :project

  belongs_to :user, optional: true

  validates :title, length: {minimum: 2}

  enum status: [:Complete, :"In Progress", :"On Hold", :Assigned, :Unassigned ]
  enum priority: [:Urgent, :High, :Medium, :Low]

end
