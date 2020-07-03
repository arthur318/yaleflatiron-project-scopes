class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        Contact.create(contact_params)
        redirect_to "/jobs"
    end

    def show
        @contact = Contact.find(params[:id])
    end


    def cold
        @user = User.find(session[:user_id])
        @contact = Contact.find(params[:id])
    end


    def thankyou
        @user = User.find(session[:user_id])
        @contact = Contact.find(params[:id])
    end



    private

    def current_company
        @company = Company.find(params[:id])
    end

    def contact_params
        # defaults = {company_id: current_company.id}
        # .reverse_merge(defaults)
        params.require(:contact).permit(:company_name, :company_id, :first_name, :last_name, :title, :email, :phone, :notes)
    end


end
