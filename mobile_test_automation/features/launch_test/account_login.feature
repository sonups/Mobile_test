Feature:
  A user should be able to create an account, login, delete his account and signout from vivino app

  Background:
    Given I open the app and the app's main page is displayed
    And I logout from the application if already logged in


Scenario: As a user I should be able to login to vivino app
	Given I click on I have an account button in WelcomePage
	And I type test@gmail.com as email and Welcome123 as password in welcome page
	Then I verify the main page is displayed