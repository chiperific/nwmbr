# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  {email: "admin@example.com", password: "Gha1ecr0w", password_confirmation: "Gha1ecr0w", username: "Admin", role: "Admin", confirmed_at: Time.now()},
  {email: "moderator@example.com", password: "Gha1ecr0w", password_confirmation: "Gha1ecr0w", username: "Moderator", role: "Moderator", confirmed_at: Time.now()},
  {email: "contributor@example.com", password: "Gha1ecr0w", password_confirmation: "Gha1ecr0w", username: "Contributor", role: "Contributor", confirmed_at: Time.now()},
  {email: "guest@example.com", password: "Gha1ecr0w", password_confirmation: "Gha1ecr0w", username: "Guest", role: "Guest", confirmed_at: Time.now()},
])
