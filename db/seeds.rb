# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: "Arthur", username: "Arthur", email: "arthur318@yahoo.com", password_digest: "password1")

company1 = Company.create(name: "Google", website: "https://www.google.com/")
company2 = Company.create(name: "Facebook", website: "https://www.facebook.com/")

job1 = Job.create(user_id: u1.id, company_id: company1.id, role: "Engineer", status: "Prospect", location: "San Francisco")

tag1 = Tag.create(name: "high priority")
tag2 = Tag.create(name: "tech")

jobtag1 = JobTag.create(job_id: job1.id, tag_id: tag1.id)
jobtag2 = JobTag.create(job_id: job1.id, tag_id: tag2.id)

contact1 = Contact.create(company_id: 1, first_name: "Arthur", last_name: "Hwang", title: "Recruiter")

# t.integer "company_id", null: false
# t.string "first_name"
# t.string "last_name"
# t.string "title"
# t.string "email"
# t.string "phone"
# t.string "notes"
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.index ["company_id"], name: "index_contacts_on_company_id"
