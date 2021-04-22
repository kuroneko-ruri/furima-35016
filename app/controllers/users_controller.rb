class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @items = @user.items.order('created_at DESC')
  end
end
