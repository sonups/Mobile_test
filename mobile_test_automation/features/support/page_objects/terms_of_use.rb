# frozen_string_literal: true

class TermsOfUsePopUp
  # vivino.web.app.beta:id/alertTitle << Terms of Use
  # android:id/message << Please accept the Terms of Use and the Privacy Policy to create an account
  # cancel << android:id/button2 CANCEL
  #    accept<< android:id/button1 ACCEPT
  #

  # EMAIL = { id: 'vivino.web.app.beta:id/edtEmail' }.freeze

  attr_accessor :driver, :action_helper

  def initialize(driver)
    @driver = driver
    @action_helper = ActionsHelper.new(driver)
  end

  def enter_email_and_password(email, password)
    action_helper.type(EMAIL, email)
    action_helper.type(PASSWORD, password)
  end
end
