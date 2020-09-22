class UsersController < ApplicationController

  def index
    if current_user != nil?
      # current_userが存在する場合はログイン中ユーザーの画面へ
      @users = User.where.not(id: current_user&.id)
    else
      # current_userがnilの場合はトップ画面へ戻ります
      redirect_to controller: 'top', action: 'index'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: current_user.id)
  end

  # def destroy
  #   current_user = nil
  #   # 削除後、homeページに戻す
  # end

end
