class JobsController < ApplicationController
    # before_action :authenticated
    
    def index
        @jobs = Job.all
    end

end
