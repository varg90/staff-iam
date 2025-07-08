# frozen_string_literal: true

namespace :db do
  desc "Create user and database with required permissions"
  task raw_prepare: :environment do
    uri = URI.parse(ENV.fetch("DATABASE_URL"))
    raise "DATABASE_URL is not set\nAdd a DATABASE_URL to your .env.*.local file" if uri.nil?

    db_name = uri.path[1..]

    # Errors with "already exists" can be safely ignored.
    # This task is not the only way to prepare, but you would need
    # higher privileges on the database user, which is bad.

    # Create user
    system(
      "sudo", "su", "postgres", "-c",
      %(createuser -h "#{uri.host}" -p "#{uri.port}" --echo "#{uri.user}")
    )
    # Set password for the user
    system(
      "sudo", "su", "postgres", "-c",
      %(psql -h "#{uri.host}" -p "#{uri.port}" \
        -c "ALTER USER #{uri.user} WITH PASSWORD '#{uri.password}';")
    )

    # Create database for current environment
    system(
      "sudo", "su", "postgres", "-c",
      %(createdb -h "#{uri.host}" -p "#{uri.port}" --echo \
        --owner "#{uri.user}" -E utf8 "#{db_name}")
    )
  end
end
