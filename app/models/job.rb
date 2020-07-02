class Job < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :job_tags
  has_many :tags, through: :job_tags

  def self.by_tag(name)
    tag = Tag.find_by(name: name)
    Job.joins(:job_tags).where(job_tags: {tag_id: tag.id})
  end

end
