require 'yaml'
require 'pry'
require_relative '../base_driver'
require_relative '../../support/properties/run_properties_label'
require_relative '../../support/properties/environments_label'

#Implementation of Base driver. More Android specific features can be added the implentation based on requirement
class AndroidDriver < BaseDriver
  attr_reader :capabilities

  ANDROID_CONFIGURATION_FILE = File.join(File.dirname(__FILE__), '../properties/capabilities/android_capabilities.yml')

  def create_driver(configuration)
    super

    #prepare_capabilities(configuration[:port])
  end

  def configuration_file
    ANDROID_CONFIGURATION_FILE
  end

=begin
  def start_driver
    super
  end
=end

  # def prepare_capabilities(port)
  #   @capabilities[:caps][:app] = @app
  #   @capabilities[:caps][:package] = @package
  #   @capabilities[:appium_lib] = { port: port }
  #   package_from_yaml = @capabilities[:caps][:package]
  # end

#   def set_package
#   package_environment = ENV[Environments::PACKAGE]
#   package_from_yaml = @capabilities[:caps][:package]
#   if package_environment.nil?
#     @package = package_environment
#   elsif package_from_yaml != ''
#     @package = package_from_yaml
#   else
#     fail ArgumentError, 'Please enter a package'
#   end
# end

end
