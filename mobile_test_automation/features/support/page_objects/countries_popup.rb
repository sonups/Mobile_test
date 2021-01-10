# frozen_string_literal: true

class CountriesPopUp
  # vivino.web.app.beta:id/alertTitle >> Please select country
  # cancel: android:id/button2
  # vivino.web.app.beta:id/txtCountry
  # swipe down and select
  #
  # Select_language
  # ----------------
  # vivino.web.app.beta:id/alertTitle >> Select Language
  # each language << vivino.web.app.beta:id/txtVintage
  # cancel >> android:id/button2

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
