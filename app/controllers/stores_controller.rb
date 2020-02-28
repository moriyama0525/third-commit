class StoresController < ApplicationController
  def show
    @food = Food.find(params[:id])
    @store = Store.new
    @comment = Comment.new(food_id: @food.id)
  end

  def create
    Store.create(user_id: current_user.id,food_id: params[:id],cock_id: params[:store][:cock_id])
  end
end
