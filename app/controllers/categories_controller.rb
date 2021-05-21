class CategoriesController < ApplicationController
    before_action :current_user, only: %i[index]

    def index
        @categories = Category.order('priority ASC')
        @featured = Article.find(featured)
    end

    def show
      @articles = Category.find(params[:id]).articles.order('id DESC')
    end

    def featured
        highest = Vote.group(:article_id).order('count_id DESC').limit(1).count(:id)
        highest.keys.first
    end
end
