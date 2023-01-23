class InteractionsController < ApplicationController

    before_action :authenticate_user!

    def create
        @article = Article.find(params[:article_id])
       @interaction = @article.interactions.create(interaction_type: "retweet", user_id: current_user.id)

        if @interaction.save()
            flash[:notice] = "Retweeted"
            redirect_back(fallback_location: root_path)
        end

    end
end
