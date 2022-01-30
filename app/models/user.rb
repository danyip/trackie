class User < ApplicationRecord

  has_and_belongs_to_many :projects
  has_and_belongs_to_many :skills

  has_many :tasks


  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, uniqueness: true

end
