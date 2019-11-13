# frozen_string_literal: true

module DepartureScraper
  module ScraperProvider
    module_function

    def call(provider_name)
      scraper = Module.const_get "DepartureScraper::Scrapers::#{provider_name.classify}"
      scraper.new
    rescue NameError
      AppLogger.fatal(self, "#{provider_name} is not available")
      exit
    end
  end
end
