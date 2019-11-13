# frozen_string_literal: true

require 'departure_scraper/validator'

RSpec.describe DepartureScraper::Validator do
  describe '.call' do
    it { expect { described_class.call([{ city: 'vienna' }]) }.to_not raise_error }
    it { expect { described_class.call([{ city: 'vienna' }, { city: 'vienna' }]) }.to raise_error(described_class::Malformed) }
  end
end
