class ChatRoomsController < ApplicationController
  before_action :set_chat_room, only: [:show, :edit, :update, :destroy]

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @letters = @chat_room.letters.last(10)
  end

  def new
    @chat_room = ChatRoom.new
  end

  def edit
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)

    respond_to do |format|
      if @chat_room.save
        format.html { redirect_to @chat_room, notice: 'Chat room was successfully created.' }
        format.json { render :show, status: :created, location: @chat_room }
      else
        format.html { render :new }
        format.json { render json: @chat_room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chat_room.update(chat_room_params)
        format.html { redirect_to @chat_room, notice: 'Chat room was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @chat_room.destroy
    respond_to do |format|
      format.html { redirect_to chat_rooms_url, notice: 'Chat room was successfully destroyed.' }
      end
  end

  private
    def set_chat_room
      @chat_room = ChatRoom.find(params[:id])
    end

    def chat_room_params
      params.require(:chat_room).permit(:name, :channel)
    end
end
