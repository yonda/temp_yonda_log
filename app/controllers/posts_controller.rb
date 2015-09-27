class PostsController < ApplicationController
  http_basic_authenticate_with name: "user", password: "secret", except: [:index, :show]

  before_action :set_post, only: %w(show edit update destroy)

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def index
    @posts = Post.all
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
