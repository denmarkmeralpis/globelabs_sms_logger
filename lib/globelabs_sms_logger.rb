require 'globelabs_sms_logger/version'
require 'globelabs_sms_logger/configuration'
require 'globelabs_sms/logger'
require 'generators/globelabs_sms_logger/install_generator'

# Module
module GlobelabsSmsLogger
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
    attr_accessor :testr
  end

  def self.testr
    puts GlobelabsSmsLogger::InstallGenerator
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
