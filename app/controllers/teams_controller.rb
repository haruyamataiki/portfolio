class TeamsController < ApplicationController
  def index
  	@teamss = Team.search(params[:search])
  end

  def show
  	@team = Team.find(params[:id])
    @team_follower= @team.follower_customers
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
     @team.build_room
	if @team.save
     redirect_to teams_path,notice:"successfully"
  else
     flash[:notice] = "error"
	   redirect_to teams_path
     end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
     @team = Team.find(params[:id])
  if @team.update(team_params)
     redirect_to team_path(@team.id),notice:"successfully"
  else
     flash[:notice] = "error"
     ender :edit
     end
  end

private
    def team_params
      params.require(:team).permit(:name, :team_image)
    end
    def recruitment_params
      params.require(:recruitment).permit(:date )
    end
end
