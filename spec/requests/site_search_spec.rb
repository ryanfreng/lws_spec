# encoding: UTF-8
require 'spec_helper'

feature "User can search and find library data", :js => true do
  before { visit '/search/' }

  scenario "search and find 'College Library' from library directory plugin" do
    page.should have_content "Your search - \"\" - did not match any web pages."

    fill_in 'search-string', with: 'College Library'
    click_on 'Search'

    page.should have_content 'College Library offers primary service to undergraduates at the University of Wisconsin-Madison.'
    page.should have_selector 'img[src$="http://library.wisc.edu/libraries/images/maps/white.PNG"]'

  end

  scenario "search and find 'Freng' from staff directory plugin" do
    page.should have_content "Your search - \"\" - did not match any web pages."

    fill_in 'search-string', with: 'Freng'
    click_on 'Search'

    page.should have_content 'Staff Directory Search: Freng'
    page.should have_content 'Ryan Freng'
    page.should have_content 'Library Application Developer'
    page.should have_content '(608) 890-1912'
    page.should have_selector 'img[src$="http://library.wisc.edu/directory/staff/Ryan-Freng.png?s=med"]'
  end

  scenario "search and find 'Towers of Midnight' from library catalog plugin" do
    page.should have_content "Your search - \"\" - did not match any web pages."

    fill_in 'search-string', with: 'Towers of Midnight'
    click_on 'Search'

    page.should have_content 'Towers of Midnight in books, music, movies and more in the Library catalog'
    page.should have_content 'by Sanderson, Brandon, Jordan, Robert, 1948-2007'
    page.should have_selector 'img[src$="http://bks4.books.google.com/books?id=muXgq4C2UtoC&printsec=frontcover&img=1&zoom=5&edge=curl"]'
  end

  scenario "search and find 'copyright' from site search" do
    page.should have_content "Your search - \"\" - did not match any web pages."

    fill_in 'search-string', with: 'copyright'
    click_on 'Search'

    page.should have_content "What is Copyright?"
    page.should have_content "http://researchguides.library.wisc.edu/copyrightfordigitalmedia"
  end

end

