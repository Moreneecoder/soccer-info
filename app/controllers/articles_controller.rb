# frozen_string_literal: true

# rubocop:disable Style/Documentation

class ArticlesController < ApplicationController
  before_action :authenticate_user, only: %i[new show]
  before_action :current_user, only: %i[new show]

  def index
    @articles = Article.all
  end

  def new; end
end

# rubocop:enable Style/Documentation
