require 'active_resource/connections'
begin
  require 'retryable'
rescue LoadError
  warn "Unable to find `retryable`. Please add `gem 'retryable'` to your Gemfile."
  raise
end

class ActiveResource::Connections::Retryable < ActiveResource::Connection

  # @return [Hash] options
  # @option [Float] :sleep
  #   The number of seconds to wait between retries
  # @option [Integer] :tries
  #   The number attempts
  # @option [Array] :on
  #   A list of error classes to retry on
  # @option [Regexp] :match
  #   Retries if error message matches given expression
  class_attribute :retriable_options
  self.retriable_options = {
    :sleep => 0.5,
    :tries => 3,
    :on    => [ ActiveResource::TimeoutError, ActiveResource::SSLError, Timeout::Error, OpenSSL::SSL::SSLError,
                Errno::ETIMEDOUT, Errno::ECONNRESET, Errno::EHOSTUNREACH, EOFError, SocketError ]
  }

  protected

  def request(*)
    retryable(retriable_options) { super }
  end

end
