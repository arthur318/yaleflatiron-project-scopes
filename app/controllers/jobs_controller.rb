class JobsController < ApplicationController

    before_action :current_job, only: [:show, :edit, :update]
    
    def index
        @jobs = Job.all
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
