class ApplicationController < ActionController::Base
   before_action :authenticate_user!
   skip_forgery_protection
   before_action :configure_permitted_parameters, if: :devise_controller?
    
   protected
      def configure_permitted_parameters
         devise_parameter_sanitizer.permit(:sign_up_params) { |u| u.permit(:username, :first_name, :last_name, :email, :admin, :avatar, :password, :password_confirmation, :twitter_username, :user_tags, :avatar_cache, :remove_avatar) }
         devise_parameter_sanitizer.permit(:account_update_params) { |u| u.permit(:username, :avatar, :first_name, :last_name, :email, :avatar, :admin, :password, :password_confirmation, :current_password, :twitter_username) }
      end
end
