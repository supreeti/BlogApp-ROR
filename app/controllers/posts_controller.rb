class PostsController < ApplicationController
  def index
    @users = User.find(params[:user_id])
    @posts = @users.posts
  end

  def show
    @users = User.find(params[:user_id])
    @post = @users.posts.find(params[:id])
    @current_user = current_user
    @like = Like.new
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(
      author: @current_user,
      title: params[:post][:title],
      text: params[:post][:text],
      comment_counter: 0,
      like_counter: 0
    )

    if @post.save
      flash.now[:notice] = 'Post was successfully done.'
      redirect_to '/'
    else
      flash.now[:error] = 'Oops, try again'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
