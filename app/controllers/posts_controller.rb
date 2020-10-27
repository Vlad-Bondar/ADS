# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]  

  def index
    @posts = Post.includes(:user).where('status = ?', 'published').page(params[:page])
  end

  def show; end

  def new
    @categories = Category.all
    #byebug
    @post = Post.new
    authorize! :create, @post
    @post.build_category

    # byebug
  end

  def create
    @post = Post.new(post_params)
    # byebug
    @post.user_id = current_user.id

    @post.status = params[:status]

    if @post.save
      redirect_to '/posts/' + @post.id.to_s
    else
      render '/posts/new'
    end
  end

  def edit
    #@post = Post.find(params[:id])
    authorize! :edit, @post
    @categories = Category.all
    @empty_category = find_empty_category
  end

  def update
    
    @post.status = params[:status]

    if @post.update(post_params)
      redirect_to '/posts/' + @post.id.to_s
    else
      render '/posts/' + @post.id.to_s + '/edit'
    end
  end

  def user_posts
    @posts = User.find(current_user.id).posts.page(params[:page])
  end

  def posts_for_admin
    @posts = Post.where('status = ?', 'new_post').page(params[:page])
  end

  def destroy
    
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:header, :body, :category_id, { images: [] }, category_attributes: [:title,:_destroy])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def find_empty_category
    categories = Category.all
    empty_category = []
    categories.each do |category|
      empty_category << category if category.posts.empty?
    end
    empty_category
  end
end
