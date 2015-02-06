class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

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
    @parent = Parent.new(parent_params)
    if @parent.save
      redirect_to @parent, notice: 'Parent was successfully created.'
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
  end

  private

  def set_grade
    @grade = Grade.find(params[:id])
  end

  def grade_params
    params.require(:grade).permit(:grade_value, :teacher_id)
  end
end
