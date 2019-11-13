# frozen_string_literal: true

require 'departure_scraper/scraper_provider'
require 'departure_scraper/scrapers/base'
require 'departure_scraper/scrapers/viennaairport'

RSpec.describe DepartureScraper::ScraperProvider do
  describe '.call' do
    it { expect(described_class.call('viennaairport')).to be_an_instance_of(DepartureScraper::Scrapers::Viennaairport) }
    it { expect { described_class.call('unknown') }.to raise_error(SystemExit) }
  end
end
