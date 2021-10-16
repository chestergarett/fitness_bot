module Rapid
  class Client
    
    def self.get_by_id(id)
      response = Request.call('get', "/exercise/#{id}")
    end

    def self.get_all
      response = Request.call('get', "")
    end
  end
end
