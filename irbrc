require 'rubygems'
require 'pp'
require 'ap'
require 'wirble'
Wirble.init
Wirble.colorize

require 'hirb'
extend Hirb::Console

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end
IRB.conf[:AUTO_INDENT]=true

require 'interactive_editor'
