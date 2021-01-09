# frozen_string_literal: true

class TopRibbon
  # classs - android.widget.TextView >> 'My Profile'
  # vivino.web.app.beta:id/top_list_tab
  # vivino.web.app.beta:id/wine_explorer_tab
  # vivino.web.app.beta:id/feed_tab
  # vivino.web.app.beta:id/my_profile_tab

  # NOTIFICATIONS >> vivino.web.app.beta:id/action_notifications
  # SETTINGS >>      vivino.web.app.beta:id/action_notifications -- need to find
  # class(android.widget.ImageView)
  #
  # RIBBON_TEXT - vivino.web.app.beta:id/tabanim_toolbar >> second


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
