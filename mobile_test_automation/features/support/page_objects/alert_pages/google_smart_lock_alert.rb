class GoogleSmartLockAlertPage
  NONE_OF_ABOVE = { id: 'cancel' }.freeze
  SMART_LOCK_IDENTIFIER = { id: 'freezecredential_picker_layout' }.freeze
  attr_accessor :driver, :action_helper

  def initialize(driver)
    @driver = driver
    @action_helper = ActionsHelper.new(driver)
  end

  def getContext
    action_helper.get_context
  end

  def click_none_of_above_if_alert_present
    action_helper.click(NONE_OF_ABOVE) if action_helper.displayed?(SMART_LOCK_IDENTIFIER)
  end
end
