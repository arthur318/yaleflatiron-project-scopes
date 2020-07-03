class PagesController < ApplicationController
    skip_before_action :authenticated
    
    def index
    end

    def analytics
        @user = User.find(session[:user_id])
    end

    def show
        # render template: "pages/#{params[:page]}"
    end
end
