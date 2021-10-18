module Edamam
  class Request
    APPLICATION_ID = Rails.application.credentials.edamam[:application_id]
    APPLICATION_KEY = Rails.application.credentials.edamam[:application_key]
    BASE_URL = Rails.application.credentials.edamam[:base_url]
    def self.call(http_method, params)
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}?type=public&app_id=#{APPLICATION_ID}&app_key=#{APPLICATION_KEY}#{params}",
        headers: { 'Accept' => 'application/json' }
      )

      { code: result.code, status: 'Success', data: JSON.parse(result.body) }
    rescue RestClient::ExceptionWithResponse => e
      { code: e.http_code, status: e.message, data: Errors.map(e.http_code) }
    end
  end
end
