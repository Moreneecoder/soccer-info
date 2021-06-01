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
    category_params
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category #{@category.name.capitalize} successfully created"
      redirect_to @category
    else
      # flash[:alert] = @category.errors.full_messages
      render :new
    end
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

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
