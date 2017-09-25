require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new division', {:type => :feature}) do
  it('allows an HR manager to create a new division') do
    visit('/')
    fill_in('description', :with =>'Sales')
    click_button('Create Division')
    expect(page).to have_content('Sales')
  end
end
