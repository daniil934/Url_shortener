require 'rails_helper'
require 'spec_helper'

FactoryBot.define do
  factory :url do
    full_url { "https://www.google.com/search?client=firefox-b-d&q=rails+add_index" }
    short_url  { "3b7187" }
  end
end

RSpec.describe 'routing', type: :routing do
  it 'tests routes' do
    expect(get: '/').to route_to(controller: 'static_pages', action: 'home')
    expect(get: '/urls').to route_to(controller: 'urls', action: 'index')
    expect(get: '/urls/new').to route_to(controller: 'urls', action: 'new')
    expect(get: '/urls/1').to route_to(controller: 'urls', action: 'show', id: '1')
  end
end

RSpec.describe "Tests http responses ", type: :request do
  it "GET /urls" do
    get urls_path
    expect(response).to render_template(:index)
    expect(response).to have_http_status(:success)
  end

  it "GET /urls/new" do
    get new_url_path
    expect(response).to render_template(:new)
    expect(response).to have_http_status(:success)
  end

  it "GET /urls/1" do
    url = create(:url)
    get url_path(id: 1)
    expect(response).to render_template(:show)
    expect(response).to have_http_status(:success)
  end

  it "POST /urls/new" do
    get new_url_path
    expect(response).to render_template(:new)

    post new_url_path, params: { url: { full_url: 'https://www.google.com/search?client=firefox-b-d&q=rails+add_index'} }
    follow_redirect!
    expect(response).to render_template(:show)
    expect(response).to have_http_status(:success)
  end
end