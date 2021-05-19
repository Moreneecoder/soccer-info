class CategoriesController < ApplicationController
    def index
        @articles = Article.all
    end
end
