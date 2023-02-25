class UrlsController < ApplicationController

  def index 
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @new_short_url = generate_short_url
    @url = Url.find_by(full_url: params[:url][:full_url])
    if !@url.nil?
      flash[:success] = "Your link was already shortened: #{@url.short_url}"
      redirect_to @url  
    else 
      @url = Url.new(url_params.merge(short_url: @new_short_url))
      if @url.save 
        flash[:success] = "#{@url.short_url}"
        redirect_to root_url  
      else
      flash[:danger] = "Incorrect link"
      redirect_to root_url
      end
    end
  end 

  def show
    @url = Url.find(params[:id])
    # @url = Url.find_by(short_url: params[:url][:short_url])
  end

  def edit 
  end

    private

    def url_params
      params.require(:url).permit(:full_url)
    end

    def generate_short_url
      SecureRandom.uuid[0..5] 
    end
end
