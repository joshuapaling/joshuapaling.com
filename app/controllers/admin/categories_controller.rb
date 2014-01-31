class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/categories
  def index
    @categories = Category.all
  end

  # GET /admin/categories/new
  def new
    @category = Category.new
  end

  # GET /admin/categories/1/edit
  def edit
  end

  # POST /admin/categories
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, @category], notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /admin/categories/1
  def update
    if @category.update(category_params)
      redirect_to [:admin, @category], notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /admin/categories/1
  def destroy
    @category.destroy
    redirect_to admin_categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :slug)
    end
end
