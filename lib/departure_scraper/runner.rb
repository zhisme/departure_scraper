# frozen_string_literal: true

require 'helpers/app_logger'

module DepartureScraper
  module Runner
    module_function

    def self.call
      AppLogger.info(self, "Started with option rerun = #{DepartureScraper.app.rerun?}")

      scraper = ScraperProvider.call(DepartureScraper.app.provider)

      if DepartureScraper.app.rerun?
        formatted_data = Cache.read(scraper.cache_key).to_a
      else
        formatted_data = scraper.call
        Validator.call(formatted_data)
        Cache.write(scraper.cache_key, formatted_data)
      end

      DataWriter.call(formatted_data)
    rescue StandardError => e
      AppLogger.fatal(self, "exited. \n Reason: #{e}")
    end
  end
end
