# frozen_string_literal: true

require 'pry'
require 'rest-client'
require 'json'
require 'helpers/app_logger'

module DepartureScraper
  module WeatherFetcher
    module_function

    BASE_URL = "#{DepartureScraper.app.secrets['weather']['base_url']}/data/2.5/find"

    def call(departure)
      response = RestClient.get(
        BASE_URL,
        params: {
          q: departure.city,
          units: :metric,
          appid: DepartureScraper.app.secrets['weather']['api_key']
        }
      )

      AppLogger.info(self, "Fetched data from weather api \n #{response}")

      JSON.parse(response.body)['list'].first.to_h.dig('main', 'temp').to_i
    rescue RestClient::Exception => e
      AppLogger.error(self, "Couldn't fetch for #{departure.inspect}. Fallback to 0. Details: #{e}")
      0
    end
  end
end
