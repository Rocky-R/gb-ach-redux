class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :update_achievements, :edit_achievements]
  before_action :logged_in?, :is_student?
  before_action :is_teacher?, only: [:destroy, :index, :create, :new]

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

  def edit_achievements
    @achievements = Achievement.all
  end

  def update_achievements
    @student.achievements = []
    params[:achievements].keys.each do |achievement_id|
      @student.achievements << Achievement.find_by_id(achievement_id)
    end
    redirect_to edit_achievements_student_path
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
    params.require(:student).permit(:name, :email, :password, :teacher_id)
  end
end
