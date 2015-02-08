class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, :is_teacher?

  def index
    @teacher = Teacher.find_by_id(session[:teacher_id])
    @parent = Parent.find_by_id(session[:parent_id])
    @student = Student.find_by_id(session[:student_id])
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def show
    redirect_to teachers_path
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to teachers_path, notice: 'New teacher created successfully.'
    else
      render :new
    end
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_path, notice: 'Teacher successfully deleted.'
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:email, :name, :password)
  end
end
