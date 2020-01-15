class TeamsController < ApplicationController
  def index
  	@teams = Team.all
  end

  def show
  	@team = Team.find(params[:id])
  end

  def new
  	 # if current_customer.teams.find_by(team_id: params[:team_id]).empty?
 	if Team.find_by(customer_id: current_customer.id).present?
    
    redirect_to customers_path
     else
     @team = Team.new
     end
  end

  def create
    @team = Team.new(team_params)
    @team.customer_id = current_customer.id
	 if @team.save
        redirect_to teams_path,notice:"successfully"
    else
        flash[:notice] = "error"
	    redirect_to customers_path
    end
  end

private
    def team_params
      params.require(:team).permit(:name, :team_image)
    end


end
