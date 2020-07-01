# class SessionsController < ApplicationController
#     def create
#         @user = User.find_by(username: params[:username])
#         return head(:forbidden) unless @user.authenticate(params[:password])
#             session[:user_id] = @user.id
#         end
#     end

# end


class SessionsController < ApplicationController

    skip_before_action :authenticated, only: [:new, :create]
    
    def new
    end

    def create
        # byebug

        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            # redirect_to @user
            redirect_to "/jobs"
        else
            redirect_to "/login"
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to "/login"
    end
end