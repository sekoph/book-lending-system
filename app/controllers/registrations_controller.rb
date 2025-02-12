class RegistrationsController < ApplicationController
    # allow_unauthenticated_access
    skip_before_action :require_login, only: %i[new create] # Allow access to signup
    layout "authentication"

    def new
        # redirect_to root_path if authenticated?
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "Object successfully created"
          start_new_session_for @user
          redirect_to after_authentication_url
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    private
        def user_params
            params.require(:user).permit(:email_address, :password, :password_confirmation)
        end
    
    
end