# frozen_string_literal: true

require 'departure_scraper/cache'

RSpec.describe DepartureScraper::Cache do
  describe '.read' do
    before do
      described_class.write('some_key', 'data')
    end

    it { expect(described_class.read('some_key')).to eq('data') }
  end

  describe '.write' do
    it do
      expect { described_class.write('some_key', 'data') }.to_not raise_error
    end
  end
end
