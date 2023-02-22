class ShortUrlsController < ApplicationController

  def create
    @url = Url.new(url_params)
    @url = Url.find_by(short_url: params[:url][:short_url])
    if !@url.nil? && @url.short_url == params[:url][:short_url]
      flash[:success] = "#{@url.full_url}"
      redirect_to root_url
    else
      flash[:danger] = "Incorrect shortened link"
      redirect_to root_url  
    end
  end
  
  def show
    @url = Url.find(params[:id])
  end

  private

  def url_params
    params.require(:url).permit(:full_url, :short_url)
  end
end
