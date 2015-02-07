module ApplicationHelper
  def grade_view_filter
    @user = Teacher.find_by_id(session[:user_id]) ||
            Student.find_by_id(session[:user_id]) ||
            Parent.find_by_id(session[:user_id])
    if session[:user_id] == Teacher.find_by_id(session[:user_id])
      @grades = Grade.all
    elsif session[:user_id] == Student.find_by_id(session[:user_id])
      @grades = @user.grades
    elsif session[:user_id] == Parent.find_by_id(session[:user_id])
      @grades = @user.student.grades
    end
  end
end
