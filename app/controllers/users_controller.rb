class UsersController < ApplicationController

  skip_before_action :authenticated, only: [:new, :create]

  # skip_before_action :test => not going to work
  
  def new
    @user = User.new
  end

  def create
    # byebug
    @user = User.new(user_params)

    # byebug

    if  @user.valid?
      @user.save
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/signup"
    end

  end

  def show
    @user = User.find(session[:user_id])
  end

  private

 def user_params
  params.permit(:username, :password, :password_confirmation)
 end

#  def test
#  end

end


# class UsersController < ApplicationController
#   def new
#     @user = User.new
#   end

#   def create
#     @user = User.create(user_params)  

#     if @user.valid?
#        @user.save
#        session[:user_id] = @user.id 
#        redirect_to controller: 'jobs', action: 'index'
#     else
#       flash[:errors] = @user.errors.full_messages
#       # why doesn't render :new work?
#       redirect_to "/users/new"
#     end
#   end

#   def edit
#   end

#   private

#   def user_params
#     params.require(:user).permit(:name, :email, :username, :password_digest)
#   end

# end