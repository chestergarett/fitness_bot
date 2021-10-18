module Rapid
  class Client
    def self.workout_all
      Request.call('get', '/exercises')
    end

    def self.workout_by_id(id)
      Request.call('get', "/exercises/exercise/#{id}")
    end

    def self.workout_by_name(name)
      Request.call('get', "/exercises/name/#{name}")
    end

    def self.workout_by_body_part(body_part)
      Request.call('get', "/exercises/bodyPart/#{body_part}")
    end

    def self.workout_by_target(target)
      Request.call('get', "/exercises/target/#{target}")
    end

    def self.workout_by_equipment(equipment)
      Request.call('get', "/exercises/equipment/#{equipment}")
    end
  end
end
