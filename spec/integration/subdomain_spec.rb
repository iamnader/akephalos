require 'spec_helper'

describe "Subdomains" do
  before do
    @session = Capybara::Session.new(:akephalos, TestApp)
  end

  context "with a subdomain" do
    it "should remember the subdomain after page visits" do
      #Capybara.default_host = "subdomain1.localhost"
      Capybara.app_host = "http://subdomain1.lvh.me:9887"
      @session.visit "/"
      p @session.current_url
      @session.current_url.should include "subdomain1"
      
      #Capybara.default_host = "subdomain2.localhost"
      Capybara.app_host = "http://subdomain2.lvh.me:9887"
      @session.visit "/"
      p @session.current_url
      @session.current_url.should include "subdomain2"
    end
  end

end
