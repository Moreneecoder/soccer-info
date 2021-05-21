class CategoriesController < ApplicationController
    def index
        @categories = Category.order('priority ASC')
        @featured = Article.find(featured)
    end

    def show
      
    end

    def featured
        highest = Vote.group(:article_id).order('count_id DESC').limit(1).count(:id)
        highest.keys.first
    end
end
