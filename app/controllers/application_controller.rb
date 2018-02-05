class ApplicationController < ActionController::Base
  layout 'inside_tmpl'

  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :notification

  protected

  def notification
    @notifications = Notification.where(recipient: current_user).where.not(author: current_user).reverse
  end

  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email)
    end
    
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :current_password)
    end
 end

end
