class User < ApplicationRecord
    has_many :jobs
    has_many :companies, through: :jobs
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    # validates :email, presence: true
    # validates :email, uniqueness: true

    def my_companies
        Company.joins(:jobs).where(jobs: {user_id: self.id}).distinct
    end
    
    def job_count
       self.jobs.count
    end


    def my_jobs
        User.joins(:jobs)
    end

    def job_by_status(status)
        Job.where(user_id: self.id, status: status)
    end

    def prospect
        job_by_status("Prospect")
    end

    def applied
        job_by_status("Applied")
    end

    def interviewing
        job_by_status("Interviewing")
    end

    def offer
        job_by_status("Offer")
    end

    def rejected
        job_by_status("Rejected")
    end

    def unavailable
        job_by_status("Unavailable")
    end

    def job_by_location(location)
        Job.where(id: self.id, location: location)
    end

    def job_by_role(role)
        Job.where(id: self.id, role: role)
    end

    def job_by_tag(name)
        tag = Tag.find_by(name: name)
        Job.joins(:job_tags).where(user_id: self.id).where(job_tags: {tag_id: tag.id})
    end

    def job_by_datetime(datetime)
        Job.where(id: self.id).where('created_at BETWEEN ? AND ?', datetime.beginning_of_day, datetime.end_of_day)
    end
    #DateTime.now-1 = yesterday
    #add count later

    def job_upcoming
        Job.where(id: self.id).minimum("date")
    end

end

# Credential.joins(:integration)
#   .where(user_id: current_user.id)
#   .where(integrations: {name: 'Twitter'})
#   .pluck(:id, :name)