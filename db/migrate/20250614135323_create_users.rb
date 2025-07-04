# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :role
      t.string :login_code
      t.datetime :login_code_sent_at

      t.timestamps
    end
  end
end
