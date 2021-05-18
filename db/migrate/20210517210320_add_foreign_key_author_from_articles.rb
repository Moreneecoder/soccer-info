# frozen_string_literal: true

# rubocop:disable Style/Documentation

class AddForeignKeyAuthorFromArticles < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :articles, :users, column: :author_id
  end
end

# rubocop:enable Style/Documentation
