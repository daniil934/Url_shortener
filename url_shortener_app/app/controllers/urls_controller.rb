class UrlsController < ApplicationController

  def index 
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @new_short_url = generate_short_url
    @url = Url.new(url_params)
    if @url.save
      @url.update_attribute(:short_url, @new_short_url)
      flash[:success] = "#{@url.short_url}"
      redirect_to root_url  
    else
      flash[:danger] = "Incorrect link"
      redirect_to root_url
    end
  end 

  def show
    @url = Url.find(params[:id])
  end

  def edit 
  end

    private

    def url_params
      params.require(:url).permit(:full_url, :short_url)
    end

    def generate_short_url
      SecureRandom.uuid[0..5] 
    end
end
