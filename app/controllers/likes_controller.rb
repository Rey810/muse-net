class LikesController < ApplicationController
    def create
        @like = Post.find(params[:post_id]).likes.create(user: current_user)
        
        if @like.save
            respond_to do |format|
                format.html { flash[:success] = "You liked a post."
                                redirect_back(fallback_location: root_path) }
                format.js
            end
        else
            flash[:notice] = "You could't like that post."
            redirect_back(fallback_location: user_path)
        end
    end

    def destroy
        @like = Like.find_by(user: params[:id])
        @post = Post.find(params[:post_id])

        if @like.destroy
            respond_to do |format|
                format.html { flash[:success] = "You unliked a post."
                                redirect_back(fallback_location: user_path(user_path)) }
                format.js
            end
        else
            flash[:notice] = "You could't unlike that post."
            redirect_back(fallback_location: user_path(user_path))
        end
    end
end
