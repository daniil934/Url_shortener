class UrlsController < ApplicationController

  def index 
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      #
    else
      render 'new'
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  def edit 
  end

    private

    def url_params
      params.require(:url).permit(:full_url)
    end
end
