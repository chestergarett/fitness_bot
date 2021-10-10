class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  rescue_from UserAuthenticator::AuthenticationError, with: :authentication_error

  private

  def authentication_error
    error = {
      "status" => "401",
      "source" => { "pointer" => "/code" },
      "title" => "Authentication code is invalid",
      "detail" => "You must provide valid code in order to exchange it for token."
    }

    render json: { "errors": [error] }, status: 401
  end
end
