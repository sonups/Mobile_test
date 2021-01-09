
class BasePage
  attr_accessor :driver, :action_helper

  def initialize(driver)
    @driver = driver
    @action_helper = ActionsHelper.new(driver)
  end

end