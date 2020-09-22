class TopController < ApplicationController
  def index
    # # userは現在ログイン中のユーザーいればその情報が入る
    # # そうでなければ、nilが入る
    # @user = User.find_by(id: current_user&.id)
    # if @user != nil?
    #   # userがnilでなければ、users/indexへ
    #   redirect_to controller: 'users', action: 'show'
    # end
    # # elseの場合、通常のトップページへ
  end
end
