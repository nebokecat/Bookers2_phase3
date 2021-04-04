class RoomsController < ApplicationController
  before_action :authenticate_user!
  def show
    @room = Room.find(params[:id])
    @chats = @room.chats
    @current_user = current_user
    @pair_user = User.find(params[:user_id])
    @chat = Chat.new
  end

  def create
    room = Room.create
    user = User.find(params[:user_id])
    current_user.user_rooms.create(:room_id => room.id)
    user.user_rooms.create(:room_id => room.id)
    redirect_to user_room_path(user,room)
  end
end
