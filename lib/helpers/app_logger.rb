# frozen_string_literal: true

require 'logger'

##
# Used to log actions by application
#
class AppLogger
  @logger = Logger.new(STDOUT)

  if DepartureScraper.app.env != 'development'
    @logger = Logger.new("log/#{DepartureScraper.app.env}.log", 'daily')
  end

  @logger = Logger.new('/dev/null') if DepartureScraper.app.env == 'test'

  class << self
    def info(class_name, msg)
      return unless DepartureScraper.app.verbose?

      @logger.info("[#{class_name}] \t #{msg}")
    end

    def warn(class_name, msg)
      return unless DepartureScraper.app.verbose?

      @logger.warn("[#{class_name}] \t #{msg}")
    end

    def fatal(class_name, msg)
      @logger.fatal("[#{class_name}] \t #{msg}")
    end

    def error(class_name, msg)
      @logger.error("[#{class_name}] \t #{msg}")
    end
  end
end
