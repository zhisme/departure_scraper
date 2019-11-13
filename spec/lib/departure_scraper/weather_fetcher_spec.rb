# frozen_string_literal: true

require 'departure_scraper/weather_fetcher'
require 'ostruct'

RSpec.describe DepartureScraper::WeatherFetcher do
  subject { described_class.call(departure) }

  let(:departure) { create(:departure) }

  describe '.call' do
    context 'success' do
      let(:value) { 12 }
      let(:response) do
        OpenStruct.new(
          body: JSON.dump(
            'list' => [
              {
                'main' => {
                  'temp' => value
                }
              }
            ]
          )
        )
      end

      before do
        allow(RestClient).to receive(:get).and_return(response)
      end

      it { expect(subject).to eq(value) }
    end
  end

  context 'failure' do
    before do
      allow(RestClient).to receive(:get).and_raise(RestClient::Exception)
    end

    it { expect(subject).to eq(0) }
  end
end
