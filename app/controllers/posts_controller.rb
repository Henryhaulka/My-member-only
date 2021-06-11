class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
def index
    @posts = Post.all
end


def new
    @post= current_user.posts.build
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
