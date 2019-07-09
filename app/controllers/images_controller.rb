class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.valid?
      @image.save!
      redirect_to @image
    else
      render :new
    end
  end

  def index
    @images = Image.all.order('id DESC')

    @images = Image.tagged_with(params[:filter]).order('id DESC') if params[:filter].present?
  end

  def show
    @image = Image.find_by(id: params[:id])
    flash[:error] = 'Image not found!' if @image.nil?
  end

  def destroy
    image = Image.find_by(id: params[:id])
    image&.destroy
    flash[:error] = 'Image not found for deleting' if image.nil?
    redirect_to images_path
  end

  private

  def image_params
    params[:image].permit(:url, :tag_list)
  end
end
