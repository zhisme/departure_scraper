# frozen_string_literal: true

require 'models/departure'
require 'helpers/app_logger'

module DepartureScraper
  module DataWriter
    extend self

    def call(data)
      AppLogger.info(self, 'Upserting data to db.')

      data.each do |departure_hash|
        departure = upsert_departure(departure_hash)

        NoteCreator.call(departure)
      end

      data
    rescue StandardError => e
      AppLogger.error(self, "Reason: #{e}")
      []
    end

    private

    def upsert_departure(departure_hash)
      persist_departure = Departure.find_by(city: departure_hash[:city], flight: departure_hash[:flight])

      if persist_departure
        persist_departure.tap { |d| d.update(departure_hash) }
      else
        Departure.create(departure_hash)
      end
    end
  end
end
