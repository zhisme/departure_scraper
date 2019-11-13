# frozen_string_literal: true

module DepartureScraper
  module Scrapers
    class Viennaairport < Base
      COLS_TO_FETCH = {
        time: '.fdabf-td1',
        city: '.fdabf-td2',
        flight: '.fdabf-td3'
      }.freeze.values

      def call
        super()

        session.visit DepartureScraper.app.secrets[name]['url']
        extract_data_from_table

        data
      end

      private

      def extract_data_from_table
        session.all('.detail-table .detail-table__row').map do |row|
          data << extract_departure_data(row)
        end

        data.compact!
      end

      def extract_departure_data(row)
        session.within(row) do
          time, city, flight = COLS_TO_FETCH.map { |column| session.find(column).text }

          return { time: time, city: city, flight: flight.split(/\n/).first }
        end
      rescue Capybara::ElementNotFound => e
        AppLogger.warn(self.class, "\n Reason: #{e}")
        nil
      end
    end
  end
end
