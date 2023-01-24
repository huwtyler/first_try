class UsersController < ApplicationController

    before_action :authenticate_user!, except: :show

    def show
     @user = User.find(params[:id])  
     @articles = @user.articles.order(created_at: :desc)
    # the retweets need mixing into the same query as the tweets in order to be ordered
     @retweets = @user.retweets.order(created_at: :desc)
    end

    def follow
        @user = User.find(params[:id]) 
        f = @user.followees.create(follower_id: current_user.id)

       if f.save()
        flash[:notice] = "You're now following @" + @user.slug
        redirect_back(fallback_location: root_path)
       end
    end

    def unfollow
        f = Follow.where(:follower_id => current_user.id).and(Follow.where(:followee_id => params[:id]))
        if f.destroy_all()
            flash[:notice] = "You have unfollowed @" + User.find(2).slug
            redirect_back(fallback_location: root_path)
           end
    end
end
