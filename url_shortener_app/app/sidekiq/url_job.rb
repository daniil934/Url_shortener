require 'sidekiq'
require 'sidekiq-scheduler'

class UrlJob
  include Sidekiq::Job
  
  def perform
    urls = Url.where("created_at < ?", Time.now-1.week)
    urls.all.delete
  end
end
