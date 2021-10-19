class ApplicationController < ActionController::Base
  class AuthorizationError < StandardError; end
  protect_from_forgery with: :null_session
  rescue_from AuthorizationError, with: :authorization_error
  acts_as_token_authentication_handler_for User

  private

  def authorization_error
    error = {
      'status' => '403',
      'source' => { 'pointer' => '/headers/authorization' },
      'title' => 'Not authorized.',
      'detail' => 'You have no right to access this resource.'
    }
    render json: { errors: [error] }, status: :forbidden
  end
end
