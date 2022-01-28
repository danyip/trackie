class Task < ApplicationRecord

  belongs_to :project

  has_many :users, through: 'projects'

end
