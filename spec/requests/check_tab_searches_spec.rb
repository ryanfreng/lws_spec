# encoding: UTF-8
require 'spec_helper'

feature "Should have current year as copyright" do
  before { visit '/' }

  scenario "check for current year in copyright" do
    page.should have_content '©'
    find("#copyright").should have_content Time.new().strftime("%Y")
  end

end

feature "Should have search tabs" do
  before { visit '/' }

  scenario "check for articles tab" do
    click_link 'Articles'
    page.should have_content 'Search 3 general databases simultaneously'
  end

  scenario "check for books tab" do
  end
  scenario "check for journals tab" do
  end
  scenario "check for databases tab" do
  end
  scenario "check for website tab" do
  end

end

