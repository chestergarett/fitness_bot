module Edamam
  class Request

    APPLICATION_ID = "cde8be74"
    APPLICATION_KEY = "6746fb83b091d7a1339f2b70f85ef6fb"
    BASE_URL = 'https://api.edamam.com/api/recipes/v2'

    def self.call(http_method, params)
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}?type=public&app_id=#{APPLICATION_ID}&app_key=#{APPLICATION_KEY}#{params}",
        headers: {'Accept' => 'application/json'}
      )

      {code: result.code, status: 'Success', data: JSON.parse(result.body)}
    rescue RestClient::ExceptionWithResponse => error
      {code: error.http_code, status: error.message, data: Errors.map(error.http_code)}
    end
  end
end