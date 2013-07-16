class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  # GET /posts.atom
  def index
    if params[:category]
      @posts = Post.published.joins(:categories).where("categories.id = ?", params[:category]).page(params[:page]).per(10)
    else
      @posts = Post.published.page(params[:page]).per(10)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.atom
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.published.find(params[:id])
    #DevHub Q - why is id not a named param? Like not ?id=3 where as in the index method, category is named (ie, ?category=2)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
end
