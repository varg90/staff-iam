# frozen_string_literal: true

# This file should ensure the existence of records required to run the application
# in every environment (production, # development, test).
# The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command
# (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

iam = TrackedService.create!(
  name: Rails.application.class.module_parent,
  comment: "IAM service (this one!)",
  data: { url: "http://localhost:3000" }
)
admin = User.create!(
  email: "admin@localhost",
  password: "admin"
)
AuthEntity.create!(
  user: admin,
  tracked_service: iam,
  identifier: "admin",
  access_level: "admin"
)
