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
  rescue ActiveRecord::RecordInvalid => ex
    redirect_to root_path
  end

  def show(id: )
    @project = Project.find(id)
  end
end
