class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_login, only: %i[edit update]
  before_action :require_same_user, only: %i[edit update destroy]

  def show
    if logged_in?
      @created_events = current_user.events

      @future_events = current_user.events.upcoming
      @past_events = current_user.attended_events.past
    else
      redirect_to login_path
    end
    #redirect_to login_path unless logged_in?

    #@created_events = current_user.events.upcoming #Suggested by TSE
    #@attended_events = current_user.attendances.attended_events
    #@created_events = current_user.events.attended
    # @future_events = current_user.events.upcoming
    # @past_events = current_user.attended_events.past
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Private Events #{@user.username}, you have successfully signed up."
      puts flash[:notice]
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Your account information was successfully updated.'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = 'Account and all associated articles successfully deleted.'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    return unless current_user != @user

    flash[:alert] = 'You can only edit or delete your own account.'
    redirect_to @user
  end

  def require_login
    return if logged_in?

    flash[:error] = 'You must be logged in to access this section'
    redirect_to new_login_url
  end
end
