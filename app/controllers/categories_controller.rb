class CategoriesController < ApplicationController
  before_action :current_user, only: %i[index show]
  before_action :get_categories, only: %i[index]

  def index
    @featured = Article.find(featured) if Article.exists?(id: featured)
  end

  def new
    @category = Category.new
  end

  def create
    p params
  end

  def show
    @articles = Category.find(params[:id]).articles.order('id DESC')
  end

  def featured
    highest = Vote.group(:article_id).order('count_id DESC').limit(1).count(:id)
    highest.keys.first
  end

  def get_categories
    @categories = Category.order('priority ASC')
  end
end
