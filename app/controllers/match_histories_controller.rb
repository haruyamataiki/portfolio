class MatchHistoriesController < ApplicationController
	def create
		
		@match_history = match_history.find(recruitment_id:params[:product_id])
		@match_history.save
		redirect_to team_path(@team.id)
	end

	def update
		@match_history = MachHistory.new(match_history_params)
      if @match_history.update(match_history_params)
         redirect_to team_path(@team.id)
      else
         render :edit
      end
    end

private
  def match_history_params
    params.require(:match_history).permit(:win, :lose, :draw, :score, :date, :spot)
  end
end


  	@customer = Customer.find(params[:customer_id])
