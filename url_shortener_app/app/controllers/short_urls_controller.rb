class ShortUrlsController < ApplicationController

  def new
    # @url = Url.find_by(short_url: params[:short_url])
    # flash[:success] = "#{@url.full_url}"
    # redirect_to short_url_url(@url)
  end

  def create
    # @new_short_url = generate_short_url
    # # @url = Url.new(url_params)
    # @url = Url.find_by(short_url: params[:url][:short_url])
    # if !@url.nil? && @url.short_url == params[:url][:short_url]
    #   flash[:success] = "#{@url.full_url}"
    #   redirect_to root_url
    # else
    #   flash[:danger] = "Incorrect shortened link"
    #   redirect_to root_url  
    # end
  end
  
  def show
    # @url = Url.find(params[:id])
  end

  private

  # def url_params
  #   params.require(:url).permit(:short_url)
  # end
end
