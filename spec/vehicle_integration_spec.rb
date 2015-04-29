require('capybara/rspec')
require('pry')
require('./app')

Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('path from the index to the vehicles page') do
  it('shows a welcome page with a link to the vehicles list page. On link click, shows a page with a list of vehicles') do
    visit ('/')
    click_button('vehicles_list')
    expect(page).to have_content('List of Vehicles:')
  end
  
end
