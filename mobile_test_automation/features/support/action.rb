#Actions class helper
class Actions

  def initialize(driver)
    @driver = driver
  end

  def visit(url = '/')
    driver.get(ENV['base_url'] + url)
  end

  def find_by_id(locator)
    find(:id, locator)
  end

  def find_by_accessibility_id(locator)
    find(:accessibility_id, locator)
  end

  def find(locator_type, locator)
    driver.find_element(locator_type, locator)
  end

  def clear(locator_type, locator)
    find(locator_type, locator).clear
  end

  def type(locator_type, locator, input)
    find(locator_type, locator).send_keys input
  end

  def click_on(locator_type, locator)
    find(locator_type, locator).click
  end

  def displayed?(locator_type, locator)
    driver.find_element(locator_type, locator).displayed?
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def text_of(locator_type, locator)
    find(locator_type, locator).text
  end

  def title
    driver.title
  end

  def wait_for(seconds = 5)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

  def wait_until_element(locator_type, locator)
    wait = Selenium::WebDriver::Wait.new(timeout: 30)
    wait.until { find(locator_type, locator).displayed? }
  end

end
