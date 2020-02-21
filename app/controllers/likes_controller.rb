class LikesController < ApplicationController
    def create
        @like = Post.find(params[:post_id]).likes.create(user: current_user)

        if @like.save
            @post = Post.find(params[:post_id])
            respond_to do |format|
                format.html {   redirect_back(fallback_location: root_path) }
                format.js
            end

            flash[:success] = "You liked a post."
        else
            flash[:notice] = "You could't like that post."
            redirect_back(fallback_location: user_path)
        end
    end

    def destroy
        @like = Like.find_by(id: params[:id], post: params[:post_id])

        if @like.destroy
            @post = Post.find(params[:post_id])
            respond_to do |format|
                format.html { redirect_back(fallback_location: user_path(user_path)) }
                format.js
            end
            flash[:success] = "You unliked a post."
        else
            flash[:notice] = "You could't unlike that post."
            redirect_back(fallback_location: user_path(user_path))
        end
    end
end
