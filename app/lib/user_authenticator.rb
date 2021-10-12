class UserAuthenticator

  attr_reader :authenticator, :access_token

  def initialize(code: nil, email: nil, password: nil)
    @authenticator =  code.present? ? Oauth.new(code) : @authenticator = Standard.new(email, password)
  end

  def perform
    authenticator.perform

    set_access_token
  end

  def user
    authenticator.user
  end

  private

  def set_access_token
    @access_token = user.access_token.present? ? user.access_token : user.create_access_token
  end
end

class AuthenticationError < StandardError; end
