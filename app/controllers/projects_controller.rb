class ProjectsController < ApplicationController
  permits :name

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create(project: )
    @project = Project.create!(project)
    redirect_to projects_path
  end
end
