class StaticPagesController < ApplicationController
    skip_before_action :authenticate_user!
    
    def home
        if current_user
            @feed = current_user.feed
            @comments = Comment.all
            @friendships = current_user.friends
        else
            render 'static_pages/landing_page'
        end
    end

    def privacy_policy
    end
end
