# frozen_string_literal: true

source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.5"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt"
# Use Warden for sessions [https://github.com/wardencommunity/warden]
gem "warden"
# Some grease for including Warden [https://github.com/wardencommunity/rails_warden]
gem "rails_warden", github: "wardencommunity/rails_warden"

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cable"
gem "solid_cache"
gem "solid_queue"

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Tailwind CSS [https://tailwindcss.com]
gem "tailwindcss-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# ENV variables in .env [https://github.com/bkeepers/dotenv]
gem "dotenv-rails"
# Dry Ruby [https://dry-rb.org]
gem "dry-monads"
gem "dry-validation"
# Integration of Dry::System with Rails
gem "dry-rails"

group :development, :test do
  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"

  # Generation of test data for models.
  gem "factory_bot_rails"
  # Generation of RSpec tests (and test integration).
  gem "rspec-rails"

  gem "rubocop-capybara"
  gem "rubocop-factory_bot"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "rubocop-rspec_rails"
  gem "rubocop-thread_safety"
  gem "test-prof"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Code formatter
  gem "prettier_print", require: false
  gem "syntax_tree", require: false
end

group :test do
  # Browser testing support.
  gem "capybara"
  gem "selenium-webdriver"
end
