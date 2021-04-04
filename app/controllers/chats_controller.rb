class ChatsController < ApplicationController
  before_action :authenticate_user!
  def create
    @room = Room.find(params[:id])
    @chats = @room.chats
    @current_user = current_user
    @current_user.chats.create(chat_params)
  end

  private

  def chat_params
    params.require(:chat).permit(:content).merge(room_id: params[:id])
  end
end
