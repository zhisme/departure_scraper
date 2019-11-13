# frozen_string_literal: true

require 'helpers/app_logger'

module DepartureScraper
  module Cache
    module_function

    def read(key)
      AppLogger.info(self, 'Data fetched from cache.')
      DepartureScraper.app.memcache.get(key)
    end

    def write(key, data)
      AppLogger.info(self, 'Data has been cached.')
      DepartureScraper.app.memcache.set(key, data)
    end
  end
end
