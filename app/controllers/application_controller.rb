class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :last_name, :first_name_paseudnym_readeing, :last_name_paseudnym_readeing, :birthday])
  end
end