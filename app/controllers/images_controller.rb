class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image].permit(:url))
    if @image.valid?
      @image.save!
      redirect_to @image
    else
      render :new
    end
  end

  def index
    @images = Image.all.order('id DESC')
  end

  def show
    @image = Image.find_by(id: params[:id])
    flash[:error] = 'Image not found!' if @image.nil?
  end
end
