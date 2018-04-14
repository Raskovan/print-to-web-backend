class ImagesController < ApplicationController

def create
  @image = Image.new(article_id: params[:article_id], url: params[:url], handle: params[:handle])
  if @image.save
    render json: @image
  end
end

def destroy
  @image = Image.find_by(id: params[:id])
  @image.destroy
end

end
