class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image].permit(:url))
    if @image.valid?
      @image.save!
    else
      render :new
    end
  end
end
