module Edamam
  class Client
    def self.get_recipes(http_method: http_method)
      response = Request.call('get', '/recipes/v2') 
    end
  end
end