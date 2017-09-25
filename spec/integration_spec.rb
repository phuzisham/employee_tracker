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

describe('adding a new employee', {:type => :feature}) do
  it('allows an HR manager to create a new employee') do
    test_division = Division.create({:description => 'testDivision'})
    id = test_division.id
    visit("/division/#{id}")
    fill_in('name', :with =>'Sally Sales')
    click_button('Add Employee')
    expect(page).to have_content('Sally Sales')
  end
end

describe('adding a new project', {:type => :feature}) do
  it('allows an HR manager to create a new project') do
    visit('/')
    fill_in('title', :with =>'Increase sales')
    click_button('Create Project')
    expect(page).to have_content('Increase sales')
  end
end
