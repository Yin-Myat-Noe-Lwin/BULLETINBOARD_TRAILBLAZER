class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone, :address, :birthday, :role])
      devise_parameter_sanitizer.permit(:invite, keys: [:username, :phone, :address, :birthday, :role])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :phone, :address, :birthday, :role])
    end

end
