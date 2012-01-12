require 'spec_helper'

describe ActiveResource::Connections::Retryable do

  before do
    described_class.stub :retriable_options => described_class.retriable_options.merge(:sleep => 0)
  end

  it 'should retry on connection failures' do
    req = stub_request(:get, "http://api.example.com/parents.json").
      to_timeout.then.
      to_timeout.then.
      to_return(:body => %([{"id":1, "name":"Dave"}]))
    Parent.all
    req.should have_been_made.times(3)
  end

  it 'should retry only a a few times' do
    req = stub_request(:get, "http://api.example.com/parents.json").
      to_timeout.then.to_timeout.then.to_timeout
    lambda { Parent.all }.should raise_error(ActiveResource::TimeoutError)
    req.should have_been_made.times(3)
  end

end
