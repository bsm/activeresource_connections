require 'spec_helper'

describe ActiveResource::Connections::CoreExt do

  it 'should allow resource models to have their own connections' do
    Parent.connection.should_not be(Root.connection)
    Child.connection.should be(Parent.connection)

    Root.connection.should be_instance_of(ActiveResource::Connection)
    Parent.connection.should be_instance_of(ActiveResource::Connections::Retryable)
    Child.connection.should be_instance_of(ActiveResource::Connections::Retryable)
  end

end
