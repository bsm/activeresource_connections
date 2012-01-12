require 'active_resource'

module ActiveResource::Connections
  autoload :Retryable, 'active_resource/connections/retryable'
  autoload :CoreExt, 'active_resource/connections/core_ext'

  unless ActiveResource::Base.respond_to?(:connection_class)
    ActiveResource::Base.send :include, CoreExt
  end
end

