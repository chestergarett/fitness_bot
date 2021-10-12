class UserAuthenticator::Oauth < UserAuthenticator
  class AuthenticationError < StandardError; end

  attr_reader :user, :access_token

  def initialize(code)
    @code = code
  end

  def perform
    raise AuthenticationError if code.blank?
    raise AuthenticationError if token.try(:error).present?

    prepare_user
  end

  private

  def client
    @client ||= Octokit::Client.new(
      client_id: Rails.application.credentials.GITHUB_CLIENT_ID,
      client_secret: Rails.application.credentials.GITHUB_CLIENT_SECRET
    )
  end

  def token
    @token ||= client.exchange_code_for_token(code)
  end

  def user_data
    @user_data ||= Octokit::Client.new(access_token: token).user.to_h.slice(:login, :avatar_url, :url, :email)
  end

  def prepare_user
    @user = User.exists?(email: user_data[:email]) ? User.find_by(email: user_data[:email]) : User.create(email: user_data[:email].nil? ? "#{user_data[:login]}@gmail.com" : user_data[:email],
                                                                                                          avatar_url: user_data[:avatar_url],
                                                                                                          url: user_data[:url],
                                                                                                          username: user_data[:login],
                                                                                                          provider: 'github',
                                                                                                          password: 'password',
                                                                                                          password_confirmation: 'password')
  end

  attr_reader :code
end
