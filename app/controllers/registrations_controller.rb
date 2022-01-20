class RegistrationsController < Devise::RegistrationsController
    before_action :find_activities
        
    private
    def sign_up_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :admin, :avatar, :password, :password_confirmation, :twitter_username, :user_tags)
    end

    def account_update_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :avatar, :admin, :password, :password_confirmation, :current_password, :twitter_username)
    end

    def find_activities
        @activities = Activity.all.order('created_at desc')
    end
end