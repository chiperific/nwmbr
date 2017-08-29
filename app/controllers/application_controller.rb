class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # http://devise.plataformatec.com.br/#strong-parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_ability
    current_user.ability
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :username, :approved_at, :approved_by])
      devise_parameter_sanitizer.permit(:account_update, keys: [:role, :username, :approved_at, :approved_by])
  end

end
