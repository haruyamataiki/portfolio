class MessageBroadcastJob < ApplicationJob
  def perform(message)
    team = message.room.team
    TeamChannel.broadcast_to(team,message:render_message(message))

  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
end

