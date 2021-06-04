class ChangeColumnImageInArticles < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :image, :image_data
    change_column :articles, :image_data, :text
  end
end
