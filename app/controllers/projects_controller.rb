class ProjectsController < ApplicationController

  def index

  end

  def show
    @project = Project.friendly.find(params[:id])
  end

end
