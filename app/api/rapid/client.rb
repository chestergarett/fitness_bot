module Rapid
  class Client
    def self.workout_all
      response = Request.call('get', "/exercises")
    end

    def self.workout_by_id(id)
      response = Request.call('get', "/exercises/exercise/#{id}")
    end

    def self.workout_by_name(name)
      response = Request.call('get',"/exercises/name/#{name}")
    end

    def self.workout_by_body_part(body_part)
      response = Request.call('get', "/exercises/bodyPart/#{body_part}")
    end

    def self.workout_by_target(target)
      response = Request.call('get', "/exercises/target/#{target}")
    end

    def self.workout_by_equipment(equipment)
      response = Request.call('get', "/exercises/equipment/#{equipment}")
    end
  end
end
