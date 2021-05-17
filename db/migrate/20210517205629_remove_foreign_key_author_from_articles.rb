class RemoveForeignKeyAuthorFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :articles, :authors
  end
end
