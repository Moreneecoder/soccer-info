class ChangeCategoryToNotNullInArticles < ActiveRecord::Migration[6.1]
  def change
    change_column_null :articles, :category_id, false
  end
end
