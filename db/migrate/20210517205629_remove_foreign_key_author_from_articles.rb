# frozen_string_literal: true

# rubocop:disable Style/Documentation

class RemoveForeignKeyAuthorFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :articles, :authors
  end
end

# rubocop:enable Style/Documentation
