class UsersController < ApplicationController
  def show
   @user = User.find(current_user.id)
   @stores = Store.where(user_id: current_user.id)
  end
end
