class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @uploader = Project.new.image
    @uploader.success_action_redirect = new_project_url
  end

  def new
    @project = Project.new(key: params[:key])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])

    if @project.present?
      @project.destroy
    end

    redirect_to projects_path, notice: 'Project was successfully destroyed.'

  end

  private

  def project_params
    params.require(:project).permit(:name, :technologies_used, :image, :remote_image_url, :key)
  end
end
