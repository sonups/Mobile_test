require 'pry'
require_relative '../../features/support/drivers/android_driver'
require_relative '../../features/support/action'
class Hook
  attr_reader :is_driver_created
  attr_accessor :driver
  def setup

    # options = {
    #           caps: {
    #             platformName: :android,
    #             app: 'https://testingbot.com/appium/sample.apk'
    #           },
    #           appium_lib: {
    #             wait_timeout: 30,
    #             wait_interval: 1
    #           }
    #         }
    #

    if !is_driver_created
          @port = { port: "4723"  }
          driver = Class.new(AndroidDriver).instance
          driver.create_driver(@port)
          @is_driver_created = true
          driver.start_driver
          actions = Actions.new(driver)
          actions.wait_until_element(:accessibility_id,'inputA' )
          actions.type(:id, 'inputA',10)

    else
            puts "hi"
    end
            #prepare_driver
  end
#   def prepare_driver
#   @configuration = { props: props, location: prepare_location }
#   #@local_driver.create_driver(@configuration)
#   #@local_driver.start_driver
# end
def tear_down
  LocalDriver.instance.stop_app
  #helper.kill_appium if start_appium?
end

end
