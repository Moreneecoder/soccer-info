class CommentsController < ApplicationController
    before_action :current_user, only: %i[:create]

    def create
        p @article = Article.find(params[:article_id])
        @comment = @article.comments.build(user_id: session[:user_id], body: params[:comment][:body])
    
        if @comment.save
          redirect_to @article, notice: 'Comment was successfully created.'
        else
          redirect_to @article, alert: @comment.errors
        end

    end
    
end
