class StoresController < ApplicationController
  def show
    @food = Food.find(params[:id])
    @store = Store.new
  end

  def create
    Store.create(user_id: current_user.id,food_id: params[:id])
  end
end
