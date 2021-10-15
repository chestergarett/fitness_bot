require 'rails_helper'

describe Api::V1::SessionsController do
  describe 'session routes' do
    it 'routes to sessions create action' do
      expect(post('api/v1/sessions')).to route_to({ 'format' => :json, 'controller' => 'api/v1/sessions', 'action' => 'create' })
    end
  end
end
