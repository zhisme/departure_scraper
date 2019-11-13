# frozen_string_literal: true

module DepartureScraper
  ##
  # Some simple validation of data consistency
  #
  module Validator
    module_function

    class Malformed < StandardError; end

    def call(formatted_data)
      raise Malformed if formatted_data != formatted_data.uniq

      formatted_data
    end
  end
end
