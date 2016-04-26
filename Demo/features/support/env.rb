require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'rspec'
require 'selenium-webdriver'
Selenium::WebDriver::Firefox::Binary.path="/home/ec2-user/firefox/firefox-bin"

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.default_selector = :css


module Helpers
  def without_resynchronize
    page.driver.options[:resynchronize] = false
    yield
    page.driver.options[:resynchronize] = true
  end
end

World(Capybara::DSL, Helpers)
