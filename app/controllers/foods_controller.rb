class FoodsController < ApplicationController
    def index
        @foods = Food.page(params[:page])
    end

    def new
        @food = Food.new(flash[:notice])
    end

    def create
        food = Food.new(food_params)
        if food.save
            flash[:notice] = "「#{food.title}」を追加しました"
            redirect_to foods_path
        else
            redirect_to new_food_path, flash: {
                food: food,
                error_messages: food.errors.full_messages
            }
        end
    end

    def show
    end

    def edit
        @food = Food.find(params[:id])
    end

    def update
        @food = Food.find(params[:id])
        @food.update(food_params)
        redirect_to foods_path
    end

    def destroy
        food = Food.find(params[:id])
        food.destroy
        flash[:notice] = "「#{food.title}」を削除しました"
        redirect_to foods_path
    end

    def search
    end

    def toppage
    end

    private
    def food_params
        params.require(:food).permit(:image, :title, :content)
    end
end
