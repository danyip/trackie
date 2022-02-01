class User < ApplicationRecord

  has_many :projects
  has_and_belongs_to_many :skills

  has_many :tasks

  accepts_nested_attributes_for :skills, reject_if: :all_blank


  has_secure_password
  
  validates :email, presence: true, uniqueness: true
  validates :username, uniqueness: true
  
  

end
