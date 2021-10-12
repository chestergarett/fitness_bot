class UserAuthenticator::Standard < UserAuthenticator
  class AuthenticationError < StandardError; end
  attr_reader :user, :access_token

  def initialize(email, password)
    @email = email
    @password = password
  end

  def perform
    raise AuthenticationError if email.blank? || password.blank?
    raise AuthenticationError unless User.exists?(email: email)

    user = User.find_by(email: email)

    raise AuthenticationError unless user.valid_password?(password)

    @user = user
  end

  private

  attr_reader :email, :password
end
