class VotesController < ApplicationController
    before_action :authenticate_user
    before_action :current_user, only: %i[upvote]

    def upvote
      if Vote.exists?(user_id: @current_user.id, article_id: params[:id])
        flash[:alert] = 'You already upvoted this article'
      else
        vote = @current_user.votes.build(article_id: params[:id])

        if vote.save
          flash[:notice] = 'Article successfully upvoted'
        else
          flash[:alert] = @article.errors
        end
      end

      redirect_to categories_path
    end
end
