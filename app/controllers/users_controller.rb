class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  # def destroy
  #   current_user = nil
  #   # 削除後、homeページに戻す
  # end

end
