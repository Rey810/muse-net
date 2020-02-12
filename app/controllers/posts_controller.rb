class PostsController < ApplicationController
    def create
       @post = current_user.posts.create(post_params)
        if @post.save
            flash[:success] = "Post created!"
            redirect_back(fallback_location: root_path)
        else
            flash[:notice] = "Post unable to be created."
            render root_path
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            flash.now[:notice] = "Post deleted"
            respond_to do |format|
                format.html { redirect_back(fallback_location: root_path) }
                format.js
            end
            
        else
            flash[:notice] = "Unable to delete post."
            render root_path
        end
    end


    private
        def post_params
            params.require(:post).permit(:content, :picture)
        end
end
