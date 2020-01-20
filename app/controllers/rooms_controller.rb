class RoomsController < ApplicationController
	before_action :authenticate_customer!
    def index
    @rooms = Room.all.order(:id)
  end

  def show
    @room = Room.find(params[:id])
    @team = @room.team
    @messages = @room.messages
  end
end
