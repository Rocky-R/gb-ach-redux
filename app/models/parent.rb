class Parent < ActiveRecord::Base
  has_secure_password
  has_many :students
  belongs_to :teacher
end
