class Student < ActiveRecord::Base
  has_secure_password
  has_many :grades
  has_many :parents
  belongs_to :teacher
  has_and_belongs_to_many :achievements
end
