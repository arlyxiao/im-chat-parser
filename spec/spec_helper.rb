ENV['RACK_ENV'] = 'test'
require "bundler"
require 'im-chat-parser'


Bundler.require(:default, :test)
