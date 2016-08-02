class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # debugger
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Success login!'
      log_in(user)
      # Log the user in and redirect to the user's show page.
      redirect_to products_path
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      # debugger
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?

    flash[:info] = 'Bye bye'

    redirect_to root_url
  end
end
