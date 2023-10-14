class PostsController < ApplicationController
  def index
    @users = User.find(params[:user_id])
    @posts = @users.posts
  end

  def show
    @users = User.find(params[:user_id])
    @post = @users.posts.find(params[:id])
    @count = @post.comment_counter
  end

  def new
    @user = User.find(params[:user_id])
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
      redirect_to user_post_path(user_id: current_user.id, id: @post.id)
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
