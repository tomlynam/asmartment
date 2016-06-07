class PostsController < ApplicationController
  before_action :post, except: [:index, :new, :show, :create]

  def index
  	@posts = current_user.posts
  end

  def show
  	@post = Post.find(params[:id])
  end

	def edit
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = current_user.posts.new(post_params)
  	if @post.save
  		redirect_to posts_path(@post)
  	else
  		render :new
  	end
  end

  def update
  	if @post.update(post_params)
  		redirect_to posts_path(@post)
  	else 
  		render :edit
  	end
  end

  def destroy
  	@post.destroy
  		redirect_to posts_path
  end

  private

  def post_params
  	params.require(:post).permit(:title, :link, :body, :user_id)
  end

  def post
  	@post = current_user.posts.find(params[:id])
  end

end