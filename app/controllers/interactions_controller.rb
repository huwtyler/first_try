class InteractionsController < ApplicationController

    before_action :authenticate_user!

    def create
        @article = Article.find(params[:article_id])
        @interaction = @article.interaction.create(interaction_params)
        redirect_to root_path
    end

    private
    def interaction_params
        params.require(:interaction).permit(:user_id, :interaction_type, :article_id)
    end
end
