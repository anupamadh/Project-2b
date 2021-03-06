class UsersController < ApplicationController
  #set default user based on the id
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #check if already logged in
  before_action :require_login, only: [:show, :edit, :update, :destroy]

  #check if correct user
  # before_action :correct_user, only: [:edit, :update]
  #check if need logout
  # before_action :require_logout, only: [:new]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
     if current_user?(@user) || current_user.admin?
       @user = User.find(params[:id])
       @reviews = @user.reviews.paginate(page: params[:page])

     else
       flash[:danger] = "This is not your login. Do you want to login again?"
       redirect_to root_url
     end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)


      if @user.save
        log_in(@user)
        flash[:success] = 'User was successfully created.'
      redirect_to user_path(@user)
      else
        render 'new'
      end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

      @user.upd_user = true
      if @user.update(user_params)
        flash[:success] = 'User was successfully updated.'
        redirect_to user_path(@user)
      else
      render 'edit'
      end

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :address)
    end



  def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
      flash[:danger] = "This is not your login. Do you want to login again?"
      redirect_to root_url
    end
  end

  def require_logout
    if logged_in?
    flash[:warning] = "You must be logged out to create a new user"
    redirect_to(root_url)
  end
end


end
