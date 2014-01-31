class Admin::ImagesController < Admin::BaseController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /admin/images
  def index
    @images = Image.all
  end

  # GET /admin/images/1
  def show
  end

  # GET /admin/images/new
  def new
    @image = Image.new
  end

  # GET /admin/images/1/edit
  def edit
  end

  # POST /admin/images
  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to [:admin, @image], notice: 'Image was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /admin/images/1
  def update
    if @image.update(image_params)
      redirect_to [:admin, @image], notice: 'Image was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /admin/images/1
  def destroy
    @image.destroy
    redirect_to admin_images_url, notice: 'Image was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:image).permit(:alt, :image)
    end
end
