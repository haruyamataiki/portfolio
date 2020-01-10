class HomesController < ApplicationController
	def index
		@recruitments = Recruitment.all
	end
end
