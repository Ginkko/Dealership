require('capybara/rspec')
require('pry')
require('./app')

Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('Integration-Wrapper') do

  before() do
    Dealership.clear()
  end

  describe('path to the dealership list page', {:type => :feature}) do
    it('shows (/) a welcome page with a link to the dealership list page. On link click, shows (/dealership_list) a page with the list of dealerships.') do
      visit('/')
      click_button('dealership_list')
      expect(page).to have_content('List of Dealerships:')
    end
  end

  describe('path to the add dealership page', {:type => :feature}) do
    it('shows (/) a welcome page with a link to the add dealership page. On link click, shows (/dealership_add) a page with a form for the name of the new dealership.') do
      visit('/')
      click_button('dealership_add')
      expect(page).to have_content("Enter dealership name:")
    end
  end

end
