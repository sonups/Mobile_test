require 'rubygems'
require 'rspec/expectations'
#require 'appium_lib'
require 'selenium-webdriver'
require 'pry'
require_relative '../support/properties/run_properties_label'
require_relative '../support/properties/environments_label'

# caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'appium.txt')
#
# appium_url = 'http://localhost:4723/wd/hub'
#
# Before {
#   @driver = Selenium::WebDriver.for(:remote, :url => appium_url, :desired_capabilities => caps)
#   @driver.get(http://google.com)
# }
#
# After {
#   @driver.quit
# }

@port = ENV[Environments::PORT] || 4723

def props
  YAML.load_file(File.join(File.dirname(__FILE__), '/props.yml'))
end

def port
  @port
end
