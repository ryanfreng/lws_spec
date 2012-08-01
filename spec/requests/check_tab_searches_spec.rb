# encoding: UTF-8
require 'spec_helper'

feature "Should have current year as copyright" do
  before { visit '/' }

  scenario "check for current year in copyright" do
    page.should have_content '©'
    find("#copyright").should have_content Time.new().strftime("%Y")
  end
end

