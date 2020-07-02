class JobsController < ApplicationController

    before_action :current_job, only: [:show, :edit, :update]
    
    def index
        # @user = User.find(session[:user_id])
        @jobs = Job.all
        #Passing in user_id from session.
    end

    def show
        # @job = Job.find(params[:id])
    end

    private

    def job_params
      params.require(:job).permit(:user_id, :company_id, :role, :status, :location)
    end
  
    def current_job
        @job = Job.find(params[:id])
    end 

end
