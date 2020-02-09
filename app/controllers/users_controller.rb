class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @friendships = current_user.friendships
        @posts = current_user.posts
        @user = User.find(params[:id])
    end
end
