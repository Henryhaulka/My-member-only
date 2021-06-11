class PostsController < ApplicationController
  
def index
    @posts = Post.all
end


def new
    @post= Post.new
end

def create
    @post = current_user.posts.build(use_params)

    if @post.save
        redirect_to root_path

    else
        render :new
    end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy

  redirect_to root_path
end

private
    def use_params
        params.require(:post).permit(:title, :body)
    end
end