class ProjectsController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :edit, :destroy]

  def index
    @project_count = Project.all.size
    @projects = Project.order(:name)
    @projects_with_data = Project.where('data_available is true').order(:name)
    respond_to do |format|
      format.html
      format.csv { render text: @projects.to_csv }
      format.xls { render text: @projects.to_csv(col_sep: "\t") }
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.fetch(:project, {})
      params.require(:project).permit(:utf8, :authenticity_token, :name, :investigators, :year, :description, :id)
    end

    def authenticate_user
      #render plain: "Sorry - This page is intentionally inaccessible." if !current_user_is_an_admin?
      return true
    end

    def current_user_is_an_admin?
      #col=ENV['AACT_ADMIN_USERNAMES'].split(',')
      #col.include? current_user.username
      return true
    end
end

