# frozen_string_literal: true

require 'pry'
require_relative '../../features/support/hook'
require_relative '../../features/support/page_objects/welcome_page'
require_relative '../../features/support/page_objects/create_account_page'
require_relative '../../features/support/page_objects/new_profile_page'

Given(/^Test ruby cucumber$/) do
  # puts "hello world a"
  # puts "hello world b"
end

Given(/^I click on (.*) button in WelcomePage$/) do |button|
  welcome_page = WelcomePage.new(Hook.driver)
  if welcome_page.page_displayed?
    case button
    when 'Get Started'
      welcome_page.click_get_started
    when 'See how it works'
      welcome_page.click_see_how_it_works
    when 'Try us out'
      welcome_page.click_try_us_out
    when 'I have an account'
      welcome_page.click_i_have_an_account
    else
      raise ArgumentError, 'Please specify a valid button'
    end
  end
end

Given(/^I click on Need a account button if currently in Welcome back page$/) do
  welcome_back_page = WelcomeBackPage.new(Hook.driver)
  welcome_back_page.click_need_an_account if welcome_back_page.welcome_back_page?
end

And(/^I type (.*) as email and (.*) as password in create account page$/) do |email, password|
  create_account_page = CreateAccountPage.new(Hook.driver)
  create_account_page.type_email_and_password(email, password)
end

And(/^I type auto-generated email with below password in create account page$/) do |table|
  @data = table.hashes
  data_at_first_row = @data[0]
  password = data_at_first_row['Password']
  create_account_page = CreateAccountPage.new(Hook.driver)
  t = Time.now
  random_email = "#{t.hour}#{t.min}#{t.sec}@gmail.com"
  create_account_page.type_email_and_password(random_email, password)
end

And(/^I type (.*) as email and (.*) as password in welcome page$/) do |email, password|
  welcome_back_page = WelcomeBackPage.new(Hook.driver)
  welcome_back_page.type_email_and_password(email, password)
end

Then(/^I verify the (.*) tab is currently focussed$/) do |tab_name|
  top_list_page = TopListPage.new(Hook.driver)
  top_list_page.current_tab_name_equal?(tab_name, 'sds')
end

Then(/^I verify the main page is displayed$/) do
  top_list_page = TopListPage.new(Hook.driver)
  raise 'main page not displayed' unless top_list_page.wait_until_page_displayed
end

And(/^I type (.*) as First name and (.*) as Last Name in New profile page$/) do |first_name, last_name|
  new_profile_page = NewProfilePage.new(Hook.driver)
  new_profile_page.type_first_name_and_last_name(first_name, last_name)
end

And(/^I ensure to accept terms and proceed from New profile page$/) do
  new_profile_page = NewProfilePage.new(Hook.driver)
  new_profile_page.accept_terms_and_proceed
end

And(/^I logout from the application if already logged in$/) do
  top_list_page = TopListPage.new(Hook.driver)
  if top_list_page.logged_in?
    top_list_page.launch_settings
    settings_page = SettingPage.new(Hook.driver)
    settings_page.signout
    welcome_back_page = WelcomeBackPage.new(Hook.driver)
    raise 'Welcome back page not displayed' unless welcome_back_page.wait_until_page_displayed
  else
    welcome_page = WelcomePage.new(Hook.driver)
    raise 'Welcome page not displayed' unless welcome_page.wait_until_page_displayed
  end
end

And(/^I delete account if already logged in$/) do
  top_list_page = TopListPage.new(Hook.driver)
  if top_list_page.logged_in?
    top_list_page.launch_settings
    settings_page = SettingPage.new(Hook.driver)
    settings_page.delete_account
    welcome_back_page = WelcomeBackPage.new(Hook.driver)
    raise 'Welcome back page not displayed' unless welcome_back_page.wait_until_page_displayed
  else
    welcome_page = WelcomePage.new(Hook.driver)
    raise 'Welcome back page not displayed' unless welcome_page.wait_until_page_displayed

  end
end

When(/^I open the app and the app's main page is displayed$/) do
  hook = Hook.instance
  raise 'Driver not created successfully' unless hook.setup_driver
end
