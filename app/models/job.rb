class Job < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :job_tags
  has_many :tags, through: :job_tags
  # accepts_nested_attributes_for :tags


  def self.by_tag(name)
    tag = Tag.find_by(name: name)
    Job.joins(:job_tags).where(job_tags: {tag_id: tag.id})
  end

  def company_name=(name)
    self.company = Company.find_or_create_by(name: name)
  end

  def company_name
    self.company ? self.company.name : nil
  end

  # create virtual to intercept call to database and shadow tag_name attribute
  # def tag_name=(name)
  #   self.tag = Tag.find_or_create_by(name: name)
  # end

  # def tag_name
  #   self.tag ? self.tag.name : nil
  # end


end
