class SessionsController < ApplicationController

  def log_in
    if request.post?
      user = Teacher.find_by_email(params[:email]) ||
             Student.find_by_email(params[:email]) ||
             Parent.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice] = "Welcome!"
        redirect_to grades_path
      else
        flash.now[:notice] = "Invalid e-mail or password."
      end
    end
  end

  def log_out
    session[:user_id] = nil
    redirect_to sessions_log_in_path
  end

end
