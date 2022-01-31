class Task < ApplicationRecord

  belongs_to :project

  belongs_to :user, optional: true

  validates :title, length: {minimum: 2}


end
