class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)  

    if @user.valid?
       @user.save
       session[:user_id] = @user.id 
       redirect_to controller: 'jobs', action: 'index'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password_digest)
  end

end
