# encoding: UTF-8
require 'spec_helper'

feature "User can search and find library data" do
  before { visit '/search/' }

  scenario "search and find 'College Library'" do
    page.should have_content "Your search - \"\" - did not match any web pages."

    fill_in 'search-string', with: 'College Library'
    click_on 'Search'

    page.should have_content 'College Library offers primary service to undergraduates at the University of Wisconsin-Madison.'
    page.should have_selector 'img[src$="http://library.wisc.edu/libraries/images/maps/white.PNG"]'

  end
end
