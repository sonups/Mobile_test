# frozen_string_literal: true

require 'pry'
require_relative '../../features/support/drivers/android_driver'
require_relative '../../features/support/drivers/android_smart_lock_driver'
require_relative '../../features/support/helper_class/actions_helper'

class Hook
  include Singleton
  attr_reader :is_driver_created
  attr_accessor :driver

  NUMBER_FIELD1 = { accessibility_id: 'inputA' }.freeze

  def accept_smark_lock_security
    @port = { port: '4723' }

    smart_lock_driver = Class.new(SmartLockDriver).instance
    smart_lock_driver.create_driver(@port)
    smart_lock_driver.start_driver
  end

  def setup_driver
    if !is_driver_created
      @port = { port: '4723' }
      @driver = Class.new(AndroidDriver).instance
      @driver.create_driver(@port)
      @is_driver_created = true
      @driver.start_driver
    end
    is_driver_created
  end

  def launch_app(package, activity)
    # @driver
    # @driver.launch_app
    @driver.start_activity app_package: package, app_activity: activity
  end

  def tear_down
    LocalDriver.instance.stop_app
    # helper.kill_appium if start_appium?
  end
end
