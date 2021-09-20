class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Room.ransack(params[:q])
    @rooms = @search.result
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :contact_number, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :contact_number, :email, :password, :current_password)}
  end
end
