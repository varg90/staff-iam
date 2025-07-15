# frozen_string_literal: true

class CreateAuthEntities < ActiveRecord::Migration[8.0]
  def change
    create_table :auth_entities, comment: "Authentication/access rights entries" do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :tracked_service, null: false, foreign_key: true
      t.boolean :active, null: false, default: true
      t.string :identifier, null: false, comment: "Username or other identifier"
      t.string :access_level, null: false, default: "user", comment: "Current access level"
      t.timestamp :active_from, default: "CURRENT_TIMESTAMP"
      t.timestamp :active_until
      t.string :comment
      t.column :data, :jsonb, null: false, default: "{}", comment: "Custom extra data"
      t.timestamps

      # Index includes identifier as a person can have several accounts on the same service
      t.index %i[user_id tracked_service_id identifier], unique: true
    end
  end
end
