# frozen_string_literal: true

require 'departure_scraper/note_creator'
require 'departure_scraper/weather_fetcher'

RSpec.describe DepartureScraper::NoteCreator do
  describe '.call' do
    subject { described_class.call(departure) }

    let(:departure) { create :departure }

    before do
      allow(DepartureScraper::WeatherFetcher).to receive(:call).and_return(-10)
    end

    context 'create note' do
      it { expect { subject }.to change { Note.count }.by(1) }
    end

    context 'update note' do
      let!(:note) { create :note, departure: departure }

      before do
        allow(DepartureScraper::WeatherFetcher).to receive(:call).and_return(30)
      end

      it { expect { subject }.to change { Note.count }.by(0) }
      it { expect { subject }.to change { note.reload.text }.to('At least we can go for a walk') }
    end
  end
end
