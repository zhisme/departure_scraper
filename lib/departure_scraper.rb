# frozen_string_literal: true

require 'departure_scraper/version'
require_relative '../config/application'

module DepartureScraper
  module_function

  class << self
    attr_reader :app
  end

  @app = Application.init

  class Error < StandardError; end

  def run(opts = {})
    @app.add_runtime_opts(opts)

    Runner.call
  end
end
