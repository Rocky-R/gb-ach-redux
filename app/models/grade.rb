class Grade < ActiveRecord::Base
  belongs_to :student

  def student_name
    if student
      student.name
    else
      ""
    end
  end

  def teacher_name
    if student && student.teacher
      student.teacher.name
    else
      ""
    end
  end
end
