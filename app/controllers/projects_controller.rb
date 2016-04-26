class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = Project.all
  end



  def edit
  end

  def show
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else
      flash.now[:alert] = "Project has not been updated."
      render "edit"
    end
  end

 private
  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking for was not found."
    redirect_to projects_url
  end


end
