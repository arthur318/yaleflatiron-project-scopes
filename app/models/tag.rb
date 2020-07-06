class Tag < ApplicationRecord
    has_many :job_tags
    has_many :jobs, through: :job_tags

    validates :name, presence: true, uniqueness: true

    def tags_attributes=(tag_attributes)
        tag_attributes.values.each do |tag_attribute|
          tag = Tag.find_or_create_by(tag_attribute)
          self.tags << tag
        end
    end

end
