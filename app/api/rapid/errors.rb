module Rapid
  class Errors
    def self.map(code)
      case code
      when 401
        'Sorry but this is an unauthorized request. Please try again.'
      when 404
        'Invalid Request! Please try again!'
      else
        'Service Unavailable. Thank you for your patience.'
      end
    end
  end
end

    