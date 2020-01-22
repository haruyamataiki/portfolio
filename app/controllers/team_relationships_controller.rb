class TeamRelationshipsController < ApplicationController
  def create
  	@team = Team.find(params[:team_id])
    current_customer.follow_team(@team)
    redirect_to request.referer
  end

  def destroy
  	@team = Team.find(params[:team_id])
    current_customer.unfollow_team(@team)
    redirect_to request.referer
  end
end
