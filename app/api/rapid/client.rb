module Rapid
  class Client
    
    def self.get_by_id(id)
      response = Request.call('get', id)
    end
  end
end
  