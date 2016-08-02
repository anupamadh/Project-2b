module SessionsHelper

#Set session with authenticated user
  def log_in(user)
    session[:user_id]=user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
end

def current_user?(user)
  user == current_user
end

def logged_in?
  ! current_user.nil?
  end

def log_out
  session.delete(:user_id) #delete part of the session
  @current_user  = nil
end

# Redirects to stored location (or to the default).


# Stores the URL trying to be accessed.


end
