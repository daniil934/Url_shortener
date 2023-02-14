class UrlsController < ApplicationController

  def index 
    @url = Url.new
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new
  end

  def edit 
  end
end
