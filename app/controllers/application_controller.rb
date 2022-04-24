class ApplicationController < ActionController::Base
    #before_action :authorize
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :mobile, :address])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :mobile, :address])
    end

    protected
    def authorize
        unless Admin.find_by(id: session[:admin])
            redirect_to login_url, notice: "Please log in"
        end
    end
end
