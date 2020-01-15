class RelationshipsController < ApplicationController
  def create
  	@customer = Customer.find(params[:customer_id])
    current_customer.follow(@customer)
    redirect_to request.referer
  end

  def destroy
  	@customer = Customer.find(params[:customer_id])
    current_customer.unfollow(@customer)
    redirect_to request.referer
  end

  def follower
    customer = Customer.find(params[:user_id])
    @custmer = customer.following_customer
  end

  def followed
    customer = Customer.find(params[:customer_id])
    @customers = customer.follower_customer
  end

end
