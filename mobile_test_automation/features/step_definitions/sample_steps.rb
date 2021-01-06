require "pry"
require_relative '../../features/support/hook'

Given(/^Test ruby cucumber$/) do
  puts "hello world a"
  puts "hello world b"
end

Given(/^Test scenario cucumber line$/) do
  puts "hello world2"
end

When(/^I open the app and the app's main page is displayed$/) do



  hook = Hook.new
  #hook = Hooktest.new()
  hook.setup

end
