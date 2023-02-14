class StaticPagesController < ApplicationController
  def home
  end

  def create
    @url = Url.new
  end
end
