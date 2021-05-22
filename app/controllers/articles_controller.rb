class ArticlesController < ApplicationController
  before_action :authenticate_user, only: %i[new]
  before_action :current_user, only: %i[new create show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = @current_user.articles.build(article_params)

    if @article.save
      flash[:notice] = 'Article successfully published'
      redirect_to @article
    else
      flash[:alert] = @article.errors
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :text, :image, :category_id)
  end
end
