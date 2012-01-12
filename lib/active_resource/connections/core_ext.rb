module ActiveResource::Connections::CoreExt
  extend ActiveSupport::Concern

  included do

    # @overload
    def self.connection(refresh = false)
      if defined?(@connection) || superclass == Object
        @connection = connection_class.new(site, format) if refresh || @connection.nil?
        @connection.proxy = proxy if proxy
        @connection.user = user if user
        @connection.password = password if password
        @connection.auth_type = auth_type if auth_type
        @connection.timeout = timeout if timeout
        @connection.ssl_options = ssl_options if ssl_options
        @connection
      else
        superclass.connection
      end
    end

  end

  module ClassMethods

    # Gets the class used to establish connection.
    def connection_class
      if defined?(@connection_class) && @connection_class
        @connection_class
      elsif superclass != Object
        superclass.connection_class
      else
        ActiveResource::Connection
      end
    end

    # Sets the connection class for this model to the value in the +klass+ argument.
    # The +klass+ should inherit from ActiveResource::Connection.
    def connection_class=(klass)
      @connection = nil
      @connection_class = klass
    end

  end
end
