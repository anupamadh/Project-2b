class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def require_login
    unless logged_in?
      flash[:danger] = 'You must be logged in to access this section'
      redirect_to root_url
  end
  end
end
