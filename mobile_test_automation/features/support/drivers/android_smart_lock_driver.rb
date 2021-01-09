require 'yaml'
require 'pry'
require_relative '../base_driver'
require_relative '../../support/properties/run_properties_label'
require_relative '../../support/properties/environments_label'

#Implementation of Base driver. More Android specific features can be added the implentation based on requirement
class SmartLockDriver < BaseDriver
  attr_reader :capabilities

  SMART_LOCKAPP_CONFIGURATION_FILE = File.join(File.dirname(__FILE__), '../properties/capabilities/android_smart_lock_capabilities.yml')

  def create_driver(configuration)
    super
  end

  def configuration_file
    SMART_LOCKAPP_CONFIGURATION_FILE
  end

end
