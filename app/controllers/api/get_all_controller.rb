module Api
  class GetAllController < ApplicationController
  
    def index
      get_by_id = Rapid::Client.get_by_id('1000')
  
      render json: get_by_id
    end
  end
end
