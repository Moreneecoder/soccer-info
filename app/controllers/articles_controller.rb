# frozen_string_literal: true

# rubocop:disable Style/Documentation

class ArticlesController < ApplicationController
  before_action :authenticate_user, only: %i[new show]
  before_action :current_user, only: %i[new show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    p params
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:article).permit(:title, :text, :image, :category_id)
  end
  
end

# rubocop:enable Style/Documentation
