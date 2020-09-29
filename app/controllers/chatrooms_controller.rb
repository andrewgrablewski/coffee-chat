class ChatroomsController < ApplicationController
  before_action :require_user, only: :show
  before_action :set_chatroom, only: :show

  def index
    @chatrooms = Chatroom.paginate(page: params[:page], per_page: 5).order(topic: :asc)
  end

  def show
    if !logged_in?
      flash[:error] = "Please log in first"
      redirect_to login_path
    else
      @message = Message.new
      @messages = @chatroom.messages.custom_display
    end
  end




  private

  

  def set_chatroom
    @chatroom= Chatroom.find(params[:id])
  end

end
