$: << File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'bundler/setup'
require 'active_resource/connections'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
  config.mock_with :rspec do |c|
    c.syntax = :should
  end
end
WebMock.disable_net_connect! :allow_localhost => true

class Root < ActiveResource::Base
  self.site = "http://api.example.com"
end

class Parent < Root
  self.connection_class = ActiveResource::Connections::Retryable
end

class Child < Parent
end