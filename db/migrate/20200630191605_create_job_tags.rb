class CreateJobTags < ActiveRecord::Migration[6.0]
  def change
    create_table :job_tags do |t|
      t.belongs_to :job, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
