# frozen_string_literal: true

# rubocop:disable Style/Documentation

class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :author, null: false
      t.string :title
      t.text :text
      t.string :image

      t.timestamps
    end

    add_foreign_key :articles, :users, column: :author_id
  end
end

# rubocop:enable Style/Documentation
