class UsersController < ApplicationController

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
