class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :destroy, :update]
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
    if @department.update(department_params)
      flash[:success] = "Department was successfully updated"
      redirect_to departments_path
    else
      render "edit"
    end
  end

  def destroy
    @department.destroy
    flash[:success] = "Department was successfully deleted"
    redirect_to departments_path
  end

  private
  def department_params
    params.require(:department).permit(:name)
  end

  def set_department
    @department = Department.find(params[:id])
  end
end
