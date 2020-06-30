# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: "Arthur", username: "Arthur", email: "arthur318@yahoo.com", password_digest: "password1")
u2 = User.create(name: "Jack", username: "Jack", email: "mapeiyao@gmail.com")

  # t.string "name"
  # t.string "username"
  # t.string "password_digest"
  # t.string "email"

company1 = Company.create(name: "Google", website: "https://www.google.com/")
company2 = Company.create(name: "Facebook", website: "https://www.facebook.com/")

job1 = Job.create(user_id: u1.id, company_id: company1.id, role: "Engineer", status: "Prospect", location: "San Francisco")
job2 = Job.create(user_id: u2.id, company_id: company1.id, role: "Engineer", status: "Prospect", location: "San Francisco")
job3 = Job.create(user_id: u2.id, company_id: company2.id, role: "Analyst", status: "Prospect", location: "Menlo Park")

# t.bigint "user_id"
# t.bigint "company_id"
# t.string "role"
# t.string "status"
# t.string "location"
# t.string "url"
# t.datetime "deadline"