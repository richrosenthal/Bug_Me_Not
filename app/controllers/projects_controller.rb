class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @user = User.find_by_id(params[:id])
  end
end
