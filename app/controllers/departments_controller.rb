class DepartmentsController < ApplicationController
  before_action :department_params, only: [:show, :edit, :destroy, :update]
  before_action :require_admin, except: [:index, :show]

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new
  end

  def edit
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:success] = "Department was successfully created"
      redirect_to departments_path
    else
      render "new"
    end
  end

  def update
  end

  def destroy
  end

  private
  def department_params
    params.require(:department).permit(:name)
  end
end
