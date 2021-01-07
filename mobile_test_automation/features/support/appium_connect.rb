require 'rubygems'
require 'pry'
require 'appium_lib'

def basic

  opts = {
    caps: {
      platformName: :android,
      app: 'https://testingbot.com/appium/sample.apk',
      automationName: 'UiAutomator2'
    },
    appium_lib: {
      wait_timeout: 30,
      wait_interval: 1
    }
  }
  binding.pry
  appium_driver = Appium::Driver.new(opts, true)
  driver = appium_driver.start_driver

  wait = Selenium::WebDriver::Wait.new(timeout: 30)
  wait.until { driver.find_element(:accessibility_id, 'inputA').displayed? }

  driver.find_element(:id, 'inputA').send_keys 8

  driver.find_element(:accessibility_id, 'inputB').send_keys 10

  driver.find_element(:accessibility_id, 'inputA').send_keys 5
  driver.find_element(:accessibility_id, 'inputB').send_keys 10
  result = driver.find_element(:accessibility_id, 'sum')

  if !result.nil? && (result.text.eql? '15')
    puts 'Test Passed'
  else
    puts 'Test Failed'
  end
  driver.quit

end

#basic
