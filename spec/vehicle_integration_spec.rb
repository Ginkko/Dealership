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

describe('path from the vehicle list to the vehicle add page', {:type => :feature}) do
    it('shows a page with a list of vehicles and a link to the vehicle add page. On link click, shows a page with a form to enter information about the new vehicle.') do
      visit('/vehicle_list')
      click_button('vehicle_add')
      expect(page).to have_content('Enter vehicle information:')
    end
end

describe('path from the vehicle add page to the vehicle list', {:type => :feature}) do
  it('shows a page with a form to enter information about the new vehicle and a submit button. On button click, shows a page with a list of vehicles, including the new vehicle.') do
    visit('/vehicle_add')
    fill_in('make', :with => 'Toyota')
    fill_in('model', :with => 'Prius')
    fill_in('year', :with => 2000)
    click_button('save_vehicle')
    expect(page).to have_content('Toyota')
  end
end
