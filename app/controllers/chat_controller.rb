class ChatController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show]

  def create
    # create処理
    # ログイン中ユーザーIDを使って、自分の持つチャットルームを取得
    @now_user_id = current_user.id
    current_user_chat_rooms = ChatRoomUser.where(user_id: @now_user_id).map(&:chat_room)
    # 自分の持つチャットルームから相手のいるチャットルームを探す
    chat_room = ChatRoomUser.where(chat_room: current_user_chat_rooms, user_id: params[:user_id]).map(&chat_room).first
    # なければ新規作成
    # chat_room = ChatRoom.find_by(id: params[:id])
    p chat_room
    if chat_room.blank?
      chat_room = ChatRoom.create
      ChatRoomUser.create(chat_room: chat_room, user_id: @now_user_id)
      ChatRoomUser.create(chat_room: chat_room, user_id: params[:user_id])
    end
    # チャットルームへリダイレクトさせる
    redirect_to action: :show, id: chat_room.chat_room_id
  end

  def show
    p params[:id]
    chat_room = ChatRoom.find_by(id: params[:id])
    @chat_room_user = chat_room&.chat_room_users.where.not(user_id: @now_user_id).first.user
    @chat_messages = ChatMessage.where(chat_room: chat_room).order(:created_at)
  end

end
