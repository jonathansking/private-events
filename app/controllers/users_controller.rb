class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
    @attended_events = @user.attended_events
    @upcoming_events = current_user.upcoming
    @prev_events = current_user.previous
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
