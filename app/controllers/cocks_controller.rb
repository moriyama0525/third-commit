class CocksController < ApplicationController
  def show
    @foods = Food.where(cock_id: current_cock.id)
  end
end
