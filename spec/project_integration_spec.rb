require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/')
    click_on('Add a new Word')
    fill_in('word', :with => 'Blue')
    click_on('Add Word')
    click_on("Blue")
    expect(page).to have_content('Blue')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a definition and then goes to the word page') do
    visit('/')
    click_on('Blue')
    click_on('Add a Definition')
    fill_in('definition', :with => 'Color that is opposite of Orange')
    click_on('Add Definition')
    click_on("Blue")
    expect(page).to have_content('Color that is opposite of Orange')
  end
end

describe('update a definition', {:type => :feature}) do
  it('updates a definition') do
    visit('/')
    click_on('Blue')
    click_on('Color that is opposite of Orange')
    click_on('Update Definition')
    fill_in('definition', :with => "Primary color that isn't red or yellow")
    click_on('Redefine')
    click_on("Blue")
    expect(page).to have_content("Primary color that isn't red or yellow")
  end
end

describe('delete a definition', {:type => :feature}) do
  it('deletes a definition') do
    visit('/')
    click_on('Blue')
    click_on("Primary color that isn't red or yellow")
    click_on('Update Definition')
    click_on('Delete Definition')
    click_on("Blue")
    expect(page).to have_no_content("Primary color that isn't red or yellow")
  end
end

describe('update a word', {:type => :feature}) do
  it('updates a word') do
    visit('/')
    click_on('Blue')
    click_on('Update Word')
    fill_in('word', :with => "Red")
    click_on('Redefine')
    expect(page).to have_content("Red")
  end
end

describe('delete a word', {:type => :feature}) do
  it('deletes a word') do
    visit('/')
    click_on('Red')
    click_on('Update Word')
    click_on('Delete Word')
    expect(page).to have_no_content("Red")
  end
end
