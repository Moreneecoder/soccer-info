# frozen_string_literal: true

# rubocop:disable Style/Documentation

class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# rubocop:enable Style/Documentation
