class HomesController < ApplicationController
	def index
		@recruitments = Recruitment.all
		@customers = Customer.all
		@teams = Team.all
	end
end
