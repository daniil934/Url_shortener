require 'rails_helper'
require 'spec_helper'

RSpec.describe UrlsController, type: :controller do
  subject(:urls) {
     Url.new(full_url: 'https://www.google.com/search?client=firefox-b-d&q=rails+add_index',
             short_url: '3b7187')
  } 

  it "Full url should be valid" do
    expect(urls).to be_valid
  end

  it "Full url cannot be nil" do
    urls.full_url = nil
    expect(urls).to_not be_valid
  end

  it "Short url cannot be nil" do
    urls.short_url = nil
    expect(urls).to_not be_valid
  end

  it "Short url has to be present" do
    urls.short_url = " "
    expect(urls).to_not be_valid
  end

  it "Full url has to be present" do
    urls.full_url = " "
    expect(urls).to_not be_valid
  end

  it "Short url must strictly consist of 6 characters" do
    urls.short_url = "a2323aA"
    expect(urls).to_not be_valid
  end

  it "Full url cannot be too long" do
    urls.full_url = "a" * 256
    expect(urls).to_not be_valid
  end

  it "Url format must be valid" do
    invalid_urls = %w[google.com/search https://www.google. hts://www.google.com www.google.com]
    invalid_urls.each do |invalid_url|  
      urls.full_url = invalid_url
      expect(urls).to_not be_valid
    end
  end

  it "Urls have to be unique" do
    urls_new = Url.new(full_url: 'https://www.google.com/search?client=firefox-b-d&q=rails+add_index',
                       short_url: '3b7187')
    urls.save
    expect(urls_new).to_not be_valid
  end

  it "Database save has to be successful" do
    urls_new = Url.new(full_url: 'https://www.google.com/search?client=firefox-b-d&q=rails+add_index',
                       short_url: '3b7187')
    urls.save
    expect(urls.reload).to_not be_nil
  end

  it "Duplicate links don't save" do
    urls_new = Url.new(full_url: 'https://www.google.com/search?client=firefox-b-d&q=rails+add_index',
                       short_url: '3b7187')
    urls.save
    urls_new.save
    expect(Url.count).to eq(1)
  end
end