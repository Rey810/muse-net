class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @friendships = @user.friendships
        @posts = @user.posts
        @comments = Comment.all
    end

    def edit
        @user = User.find(current_user.id)
    end

    def update
        

        if @user = current_user.update_attributes(profile_details)
            flash[:notice] = "Your profile has been updated"
            redirect_back(fallback_location: current_user)
        else
            flash.now[:notice] = "Your profile could not be updated"
            render 'edit'
        end
    end

    private

        def profile_details
            params.require(:user).permit(:name, :picture, :started, :influence, :genre, :location)
        end
end
