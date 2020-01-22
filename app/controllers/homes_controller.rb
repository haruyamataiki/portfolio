class HomesController < ApplicationController
	def index
		@recruitments = Recruitment.all
		@customers = Customer.where.not(id:current_customer.id)
		@customers =@customers.sort do |a_customer,b_customer|
			(current_customer.total_score - a_customer.total_score).abs <=>
			(current_customer.total_score - b_customer.total_score).abs
	end
		@teams = Team.all
	end
end
