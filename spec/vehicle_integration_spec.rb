require('capybara/rspec')
require('pry')
require('./app')

Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('path from the index to the vehicle list page', {:type => :feature}) do
  it('shows a welcome page with a link to the vehicle list page. On link click, shows a page with a list of vehicles') do
    visit('/')
    test_vehicle = Vehicle.new('Atom', 'Tesla', 2014)
    test_vehicle.save()
    click_button('vehicle_list')
    expect(page).to have_content('Atom')
  end
end

describe('path from the index to the vehicle add page', {:type => :feature}) do
  it('shows a welcome page with a link to the vehicle add page. On link click, shows a page with a form to enter information about the new vehicle.') do
    visit('/')
    click_button('vehicle_add')
    expect(page).to have_content('Enter vehicle information:')
  end
end
