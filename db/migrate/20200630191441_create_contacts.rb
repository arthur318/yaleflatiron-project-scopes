class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :company, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.string :phone
      t.string :notes

      t.timestamps
    end
  end
end
