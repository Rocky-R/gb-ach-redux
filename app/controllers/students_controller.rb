class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
    redirect_to students_path
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path notice: 'Student was successfully deleted.'
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:parent).permit(:name, :email, :password, :teacher_id, :parent_id)
  end
end
