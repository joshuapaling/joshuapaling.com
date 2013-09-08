class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  # GET /posts.atom
  def index
    @posts = Post.published.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.atom
    end
  end

  def category
    @category = Category.find_by_slug(params[:slug])
    @posts = Post.published.joins(:categories).where("categories.id = ?", @category).page(params[:page]).per(10)

    respond_to do |format|
      format.html { render "index" }
      format.json { render json: @posts }
      format.atom
    end
  end

  # GET /post/my-slug
  # GET /post/my-slug.json
  def show
    @post = Post.published.find_by_slug(params[:slug])

    if @post.nil?
      raise ActiveRecord::RecordNotFound
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
end
