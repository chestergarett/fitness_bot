module Rapid
  class Request
      
    TOKEN = 'bbaa43c885mshcf11c8706286c2dp115799jsn95b9326f85e6'
    BASE_URL = 'https://exercisedb.p.rapidapi.com'
    
    def self.call(http_method, endpoint)
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}/#{endpoint}",
        headers: {'Content-Type' => 'application/json', 'X-RapidAPI-Host' => 'exercisedb.p.rapidapi.com', 'X-RapidAPI-Key' => 'bbaa43c885mshcf11c8706286c2dp115799jsn95b9326f85e6'}
      )
      JSON.parse(result.body)
      { code: result.code, status: 'Success', data: JSON.parse(result.body)}
    rescue RestClient::ExceptionWithResponse => error
      { code: error.http_code, status: error.message, data: Errors.map(error.http_code)}
    end
  end
end
