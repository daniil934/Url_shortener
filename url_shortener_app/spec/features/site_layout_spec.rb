require 'rails_helper'
require 'spec_helper'

RSpec.describe 'tests site layout', type: :feature do
  it 'tests home page' do
    visit root_path
    expect(page).to have_content('Url shortener application')
  end
  
  it 'tests page text' do
    visit new_url_path
    expect(page).to have_field('Full url')
    expect(page).to have_button('Submit url')
  end
end