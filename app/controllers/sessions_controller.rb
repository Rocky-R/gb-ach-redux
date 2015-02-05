class SessionsController < ApplicationController

  def log_in
    if request.post?
      teacher = Teacher.find_by_email(params[:email])
      if teacher && teacher.authenticate(params[:password])
        session[:teacher_id] = teacher.id
        flash[:notice] = "Welcome!"
        redirect_to students_path
      else
        flash.now[:notice] = "Invalid e-mail or password."
      end
    end
  end

  def log_out
    session[:teacher_id] = nil
    redirect_to sessions_log_in_path
  end

end
