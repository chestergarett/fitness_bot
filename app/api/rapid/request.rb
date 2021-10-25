module Rapid
  class Request
    BASE_URL = Rails.application.credentials.WORKOUT_API_URL
    API_KEY = Rails.application.credentials.WORKOUT_API_KEY
    API_HOST = Rails.application.credentials.WORKOUT_API_HOST

    def self.call(http_method, endpoint)
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}#{endpoint}",
        headers: { 'Content-Type' => 'application/json', 'X-RapidAPI-Host' => API_HOST, 'X-RapidAPI-Key' => API_KEY }
      )
      JSON.parse(result.body)
      { code: result.code, status: 'Success', data: JSON.parse(result.body) }
    rescue RestClient::ExceptionWithResponse => e
      { code: e.http_code, status: e.message, data: Errors.map(e.http_code) }
    end
  end
end
