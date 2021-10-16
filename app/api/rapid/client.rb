module Rapid
  class Client
    
    def self.get_by_id(id)
      response = Request.call('get', "/exercises/exercise/#{id}")
    end

    def self.get_all
      response = Request.call('get', "/exercises")
    end

    def self.get_by_bodyPart(bodyPart)
      response = Request.call('get', "/exercises/bodyPart/#{bodyPart}")
    end

    def self.get_by_name(name)
      response = Request.call('get',"/exercises/name/#{name}")
    end
  end
end
