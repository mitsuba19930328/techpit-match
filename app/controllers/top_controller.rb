class TopController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    # ログイン中の場合はログインユーザー用トップ画面へ遷移する
    if user_signed_in?
      redirect_to users_path
    end
  end
end
