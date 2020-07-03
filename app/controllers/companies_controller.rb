class CompaniesController < ApplicationController
    skip_before_action :authenticated

    def index
        @user = User.find(session[:user_id])
        @all = @user.my_companies
    end

    def show
        @company = Company.find(params[:id])
    end

    private

    def current_user
        @user = User.find(session[:user_id])
    end

end

# t.integer "company_id", null: false
#     t.string "first_name"
#     t.string "last_name"
#     t.string "title"
#     t.string "email"
#     t.string "phone"
#     t.string "notes"