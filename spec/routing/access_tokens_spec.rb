require 'rails_helper'

describe 'access tokens routes' do
  it 'should route to access_tokens create action' do
    expect(post 'api/v1/login').to route_to({'format' => :json, 'controller'=>'api/v1/access_tokens', 'action'=>'create'})
  end
end