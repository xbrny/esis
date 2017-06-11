class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = "Subject was successfully created"
      redirect_to @subject
    else
      render "new"
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    if @subject.update(subject_params)
      flash[:success] = "Subject was successfully updated"
      redirect_to @subject
    else
      render "edit"
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    flash[:danger] = "Subject was successfully deleted"
    redirect_to subjects_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:code, :name, :description)
    end
end
