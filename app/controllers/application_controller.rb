# frozen_string_literal: true

# rubocop:disable Style/Documentation

class ApplicationController < ActionController::Base
  def user_logged_in?
    !!session[:user_id]
  end

  def authenticate_user
    return if user_logged_in?

    flash[:alert] = 'You must sign in to continue'
    redirect_to users_signin_path
  end

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
end

# rubocop:enable Style/Documentation
