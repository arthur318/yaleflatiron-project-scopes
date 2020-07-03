class JobsController < ApplicationController
    skip_before_action :authenticated
    before_action :current_job, only: [:show, :edit, :update]
    
    def index
        @user = User.find(session[:user_id])
        @prospects = @user.prospect
        @applied = @user.applied
        @interviewing = @user.interviewing
        @offer = @user.offer
        @rejected = @user.rejected
        @unavailable = @user.unavailable
    end

    def show
        @job = Job.find(params[:id])
    end

    def new
        @job = Job.new
        @stages = ["Prospect", "Applied", "Interviewing", "Offer", "Rejected", "Unavailable"]
    end

    def create
        Job.create(job_params)
        redirect_to "/jobs"
    end

    def edit
        @job = Job.find(params[:id])
        @stages = ["Prospect", "Applied", "Interviewing", "Offer", "Rejected", "Unavailable"]
    end
  
    def update
        @job = Job.find(params[:id])
        @job.update(job_params)
        redirect_to "/jobs"
    end
  
    def destroy
    
    end

    private

    def current_job
        @job = Job.find(params[:id])
    end 

    def current_user
        @user = User.find(session[:user_id])
    end

    def job_params
        defaults = {user_id: current_user.id}
        params.require(:job).permit(:company_name, :user_id, :company_id, :role, :status, :location, :url, tag_ids:[], tags_attributes: [:name]).reverse_merge(defaults)
    end

end
