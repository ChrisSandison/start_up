class AnalyticsController < ApplicationController

  before_filter :authenticate_user!

  def index
    
  end 

  private

    def api_address
      Rails.env.production? ? "https://fast-cliffs-5271.herokuapp.com" : "http://localhost:3000"
    end

    def api_version
      "v1"
    end

end
