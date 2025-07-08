# frozen_string_literal: true

class CreateTrackedServices < ActiveRecord::Migration[8.0]
  def change
    create_table :tracked_services, comment: "Services which have auth data to be tracked" do |t|
      t.string :name, null: false
      t.string :comment
      t.column :data, :jsonb, null: false, default: "{}", comment: "Custom extra data"
      t.timestamps
    end
  end
end
