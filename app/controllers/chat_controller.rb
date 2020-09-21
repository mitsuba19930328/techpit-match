class ChatController < ApplicationController

  def create
    # create処理
    # ログイン中ユーザーIDを使って、自分の持つチャットルームを取得
    current_user_chat_rooms = ChatRoomUser.where(user_id: current_user.id).map(&:chat_room)
    # 自分の持つチャットルームから相手のいるチャットルームを探す
    chat_room = ChatRoomUser.where(chat_room: current_user_chat_rooms, user_id: params[:user_id]).map(&chat_room).first
    # なければ新規作成
    if chat_room.blank?
      chat_room = ChatRoom.create
      ChatRoomUser.create(chat_room: chat_room, user_id: current_user.id)
      ChatRoomUser.create(chat_room: chat_room, user_id: params[:user_id])
    end
    # チャットルームへリダイレクトさせる
    redirect_to action: :show,id: chat_room.id
  end

  def show
    chat_room = ChatRoom.find_by(id: params[:id])
    @chat_room_user = chat_room.chat_room_users.where.not(user_id: current_user.id).first.user
    @chat_messages = ChatMessage.where(chat_room: chat_room).order(:created_at)
  end

end
