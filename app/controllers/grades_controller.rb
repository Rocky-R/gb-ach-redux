class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?

  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def show
    redirect_to grades_path
  end

  def edit
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to @grade, notice: 'Grade was successfully created.'
    else
      render :new
    end
  end

  def update
    if @grade.update(grade_params)
      redirect_to @grade, notice: 'Grade was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @grade.destroy
    redirect_to grades_path notice: 'Grade was successfully deleted.'
  end

  private

  def set_grade
    @grade = Grade.find(params[:id])
  end

  def grade_params
    params.require(:grade).permit(:grade_value, :student_id)
  end
end
