# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.0'
  s.required_rubygems_version = ">= 1.3.6"

  s.name        = "activeresource_connections"
  s.summary     = "Custom connections for ActiveResource models"
  s.description = "Extend your ActiveResource model's connections"
  s.version     = '0.1.0'

  s.authors     = ["Dimitrij Denissenko"]
  s.email       = "dimitrij@blacksquaremedia.com"
  s.homepage    = "https://github.com/bsm/activeresource_connections"

  s.files        = Dir['lib/**/*']

  s.add_dependency "activeresource", ">= 3.1.0"

  s.add_development_dependency "rake"
  s.add_development_dependency "bundler"
  s.add_development_dependency "rspec"
  s.add_development_dependency "retryable"
  s.add_development_dependency "webmock"
end
