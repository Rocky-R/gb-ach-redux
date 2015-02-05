class Student < ActiveRecord::Base
  has_many :grades
  belongs_to :parent
  belongs_to :teacher
end
