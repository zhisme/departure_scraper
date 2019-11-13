# frozen_string_literal: true

require 'helpers/app_logger'

module DepartureScraper
  module NoteCreator
    extend self

    def call(departure)
      temperature = WeatherFetcher.call(departure)

      if departure.note.nil?
        departure.create_note(
          simple_logic(departure.city, temperature)
        )

        AppLogger.info(self, "Created note for #{departure.city}")
      else
        departure.note.update(
          simple_logic(departure.city, temperature)
        )

        AppLogger.info(self, "Updated note for #{departure.city}")
      end
    end

    private

    ##
    # There can be anything to with data pipeline
    # we just use mock of maybe external service or whatever
    #
    def simple_logic(city, temperature)
      case city
      when 'ST. PETERSBURG'
        { text: "Cold and grey, isn't it cool?", temperature: temperature }
      when 'AMSTERDAM'
        if temperature > 0
          { text: 'You know what to do here', temperature: temperature }
        else
          { text: 'Stay at home', temperature: temperature }
        end
      when 'BARCELONA'
        { text: 'Go for a swim!', temperature: temperature }
      when 'FRANKFURT'
        { text: 'Data center', temperature: temperature }
      when 'LONDON'
        if temperature > 25
          { text: "Let's go for a pint", temperature: temperature }
        else
          { text: 'Is cold brrr', temperature: temperature }
        end
      when 'MADRID'
        if temperature < 5
          { text: '!Que frio!', temperature: temperature }
        else
          { text: 'Querría su mejor chupito, por favor.', temperature: temperature }
        end
      else
        if temperature < 5
          { text: 'Winter is here', temperature: temperature }
        else
          { text: 'At least we can go for a walk', temperature: temperature }
        end
      end
    end
  end
end
