# frozen_string_literal: true

# rubocop:disable Style/Documentation

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end
  end
end

# rubocop:enable Style/Documentation
