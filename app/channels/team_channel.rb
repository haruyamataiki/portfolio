class TeamChannel < ApplicationCable::Channel
  def subscribed
    unless (team == Team.find_by_id(params[:team_id]))
    	return reject
    end
    if team.follower_customers.include?(current_customer) || (team.customer == current_customer)
    	stream_for team
    else
    	reject
    end
  end


  def speak(data)
    Message.create! content: data['message'], customer_id: current_customer.id, team_id: params['team_id']
  end
end