class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:postcode])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:prefecture_code])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address_city])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address_street])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address_building])
  end

  def set_search
    @search = Food.ransack(params[:q])
    @search_foods = @search.result(distinct: true).order(created_at: "DESC").page(params[:page]).per(3)
  end

end
