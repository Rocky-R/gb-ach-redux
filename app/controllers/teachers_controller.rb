class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update]

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def show
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to teachers_path, notice: "New teacher created successfully."
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:email, :name, :password)
  end
end
