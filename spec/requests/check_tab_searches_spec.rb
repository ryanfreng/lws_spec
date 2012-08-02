# encoding: UTF-8
require 'spec_helper'

feature "User can navigate snd earch tabs", :js => true do
  before { visit '/'}

  scenario "click articles and search 'nature'" do
    click_link 'Articles'
    page.should have_content 'Search 3 general databases simultaneously'
    
    fill_in 'query', with: 'nature'
    click_on 'Search'
    # not logged in
    page.should have_content 'Remote Access to Library Resources'
    # logged in
    #page.should have_content 'Search Status'
  end

  scenario "click books and search 'harry potter'" do
    click_link 'Books'
    page.should have_content 'our legacy catalog'
    
    fill_in 'q', with: 'harry potter'
    click_on 'Search'
    page.should have_content 'Harry Potter years 1-4'
  end

  scenario "click journals and search 'nature'" do
    click_link 'Journals'
    page.should have_content 'Journal Title'

    fill_in 'rft.jtitle', with: 'nature'
    click_on 'Search'
    page.should have_content 'Nature ( Full text )'
  end

  scenario "click databases and search 'health'" do
    click_link 'Databases'
    page.should have_content 'Search for database names'

    fill_in 'query', with: 'health'
    click_on 'Search'
    page.should have_content 'AccessMedicine'
  end

  scenario "click site search and search 'College Library'" do
    click_link 'Site Search'
    page.should have_content 'Look for pages about'

    fill_in 'q', with: 'college library'
    click_on 'Search'
    page.should have_content 'College Library (Helen C. White)'
  end
end

feature "User selects 'My Accounts' and has all options" do 
  before { visit '/' }

  scenario "click 'My Accounts' and see list" do
    click_link 'My Accounts'
    page.should have_content 'Library'
    page.should have_content 'Catalog'
    page.should have_content 'Interlibrary Loan'
    page.should have_content 'RefWorks'
    page.should have_content 'EndNote Web'
    page.should have_content 'Campus'
    page.should have_content 'My UW'
    page.should have_content 'WiscMail'
    page.should have_content 'Learn@UW'
    page.should have_content 'My WebSpace'
  end
end

feature "Should have current year as copyright" do
  before { visit '/' }

  scenario "checks for current year in copyright" do
    page.should have_content '©'
    find("#copyright").should have_content Time.new().strftime("%Y")
  end

end

