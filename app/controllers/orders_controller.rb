class OrdersController < ApplicationController
  def index
    @stores = Store.where(cock_id: current_cock.id)
  end

  def destroy
    store = Store.find(params[:id])
    store.destroy
    redirect_to orders_path
  end
end
