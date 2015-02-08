class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

 private

  def current_user
    @current_user = Teacher.find_by_id(session[:teacher_id]) ||
                    Student.find_by_id(session[:student_id]) ||
                    Parent.find_by_id(session[:parent_id])
  end

  def is_teacher?
    if current_user == Student.find_by_id(session[:student_id])
      redirect_to grades_path
    elsif current_user == Parent.find_by_id(session[:parent_id])
      redirect_to grades_path
    end
  end

  def is_student?
    if current_user == Parent.find_by_id(session[:parent_id])
      redirect_to grades_path
    end
  end

  def is_parent?
    if current_user == Student.find_by_id(session[:student_id])
      redirect_to grades_path
    end
  end

  def logged_in?
    if current_user.nil?
      redirect_to root_path
    end
  end
end
