# frozen_string_literal: true

require 'helpers/app_logger'

module DepartureScraper
  module Scrapers
    class Base
      attr_reader :cache_key, :data

      def call
        AppLogger.info(self.class, 'Started fetching departure data')
      end

      def initialize
        @session = Capybara::Session.new(Capybara.default_driver)
        @data = []
        @cache_key = name
      end

      private

      attr_reader :session

      def name
        self.class.to_s.demodulize.downcase
      end
    end
  end
end
