class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :set_ransack
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_furigana, :last_furigana, :birthday])
  end
  
  def production?
    Rails.env.production?
  end

  def set_ransack
    @items_all = Item.all.date_desc
    @q = Item.ransack(params[:q])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
