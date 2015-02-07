class SessionsController < ApplicationController

  def log_in
    if request.post?
      teacher = Teacher.find_by_email(params[:email])
      student = Student.find_by_email(params[:email])
      parent = Parent.find_by_email(params[:email])
      if teacher && teacher.authenticate(params[:password])
        session[:teacher_id] = teacher.id
        flash[:notice] = "Welcome!"
        redirect_to grades_path
      elsif student && student.authenticate(params[:password])
        session[:student_id] = student.id
        flash[:notice] = "Welcome!"
        redirect_to grades_path
      elsif parent && parent.authenticate(params[:password])
        session[:parent_id] = parent.id
        flash[:notice] = "Welcome!"
        redirect_to grades_path
      else
        flash.now[:notice] = "Invalid e-mail or password."
      end
    end
  end

  def log_out
    session[:teacher_id] = nil
    session[:student_id] = nil
    session[:parent_id] = nil
    redirect_to sessions_log_in_path
  end

end
