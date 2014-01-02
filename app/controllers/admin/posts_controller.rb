class Admin::PostsController < ApplicationController
  layout 'admin'
  before_action :set_admin_post, only: [:show, :edit, :update, :destroy]

  # GET /admin/posts
  def index
    @admin_posts = Post.all
  end

  # GET /admin/posts/1
  def show
  end

  # GET /admin/posts/new
  def new
    @admin_post = Post.new
  end

  # GET /admin/posts/1/edit
  def edit
  end

  # POST /admin/posts
  def create
    @admin_post = Post.new(admin_post_params)

    if @admin_post.save
      redirect_to @admin_post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /admin/posts/1
  def update
    if @admin_post.update(admin_post_params)
      redirect_to @admin_post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /admin/posts/1
  def destroy
    @admin_post.destroy
    redirect_to admin_posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_post
      @admin_post = Post.find_by_slug(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_post_params
      params[:admin_post]
    end
end
