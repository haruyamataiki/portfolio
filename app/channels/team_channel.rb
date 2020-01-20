class TeamChannel < ApplicationCable::Channel
  def subscribed
  	# p current_customer.id
  	# p "test"
    unless (team = Team.find_by_id(params[:team_id]))
    	return reject
    end
    # p team.follower_customers.include?(current_customer)
    # p (team.customer == current_customer)
    if team.follower_customers.include?(current_customer) || (team.customer == current_customer)
    	stream_for team
    else
    	reject
    end
  end


  def speak(data)
    Message.create! content: data['message'], customer_id: current_customer.id, room_id: params['room_id']
  end
end