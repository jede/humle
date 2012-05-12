
RSpec.configure do |config|
end

APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), ".."))

require 'mongoid'
ENV['RACK_ENV'] = 'test'
Mongoid.logger.level = Logger::INFO
Mongoid.load!(APP_ROOT + '/config/mongoid.yml')
require 'mongoid_fulltext'

require 'factory_girl'
require APP_ROOT + '/test/factories.rb'
