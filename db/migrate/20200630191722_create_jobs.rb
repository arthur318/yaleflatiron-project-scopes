class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :company, null: false, foreign_key: true
      t.string :role
      t.string :status
      t.string :location
      t.string :url
      t.string :deadline

      t.timestamps
    end
  end
end
