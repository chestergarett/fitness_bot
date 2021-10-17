module Edamam
  class Request
    APPLICATION_ID = 'cde8be74'.freeze
    APPLICATION_KEY = '6746fb83b091d7a1339f2b70f85ef6fb'.freeze
    BASE_URL = 'https://api.edamam.com/api/recipes/v2'.freeze
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
