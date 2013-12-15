require 'spec_helper'

describe "Static pages", :type => :feature do
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end
  end


  describe "About page" do
    it "should have the content About Page" do
      visit static_pages_about_path
      page.should have_selector('nav')
    end
  end

end

