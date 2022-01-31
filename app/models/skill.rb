class Skill < ApplicationRecord

  has_and_belongs_to_many :users

  validates :skill_type, length: {minimum: 3}

end
