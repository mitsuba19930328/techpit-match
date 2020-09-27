class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit]

  def index
    @users = User.where.not(id: current_user.id)
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
