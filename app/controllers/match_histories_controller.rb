class MatchHistoriesController < ApplicationController
	def create
		match_history.customer = current_customer.id
		match_history = MachHistory.new(match_history_params)


	end

	def update
	end

private
  def match_history_params
    params.require(:match_history).permit(:title, :body, :category, :score, :date, :spot)
  end
end
