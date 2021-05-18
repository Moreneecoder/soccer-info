# frozen_string_literal: true

# rubocop:disable Style/Documentation

class AddCategoryToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :category, foreign_key: true
  end
end

# rubocop:enable Style/Documentation
