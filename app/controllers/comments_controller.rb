class CommentsController < ApplicationController

    before_action :authenticate_user!
    
    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      redirect_to @article
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to @comment.article, status: :see_other
    end
  
    private
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
  end
  