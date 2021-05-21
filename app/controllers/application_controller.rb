# frozen_string_literal: true

class ApplicationController < ActionController::Base
    def user_logged_in?
        !!session[:user_id]
    end
    
    def authenticate_user
        # other_user = User.find(params['id'])
    
        if !user_logged_in?
          flash[:alert] = 'You must sign in to continue'
          redirect_to users_signin_path
        # else
        #   flash[:alert] = 'You cannot access that page'
        #   redirect_to current_user
        end
    end
    
    def current_user
        @current_user = User.find(session[:user_id]) if session[:user_id]
    end
end
