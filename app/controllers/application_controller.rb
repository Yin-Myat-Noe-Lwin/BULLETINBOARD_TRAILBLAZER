class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone, :address, :birthday, :role])
    end

    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

end
