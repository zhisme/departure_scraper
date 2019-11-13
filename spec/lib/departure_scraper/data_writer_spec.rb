# frozen_string_literal: true

require 'departure_scraper/note_creator'
require 'departure_scraper/data_writer'
require 'models/departure'

RSpec.describe DepartureScraper::DataWriter do
  describe '.call' do
    subject { described_class.call(data) }

    let(:data) do
      [
        { city: 'LONDON', flight: 'LZ 918', time: '19:05' }
      ]
    end

    context 'success' do
      before do
        note_creator = double(DepartureScraper::NoteCreator)
        allow(note_creator).to receive(:call).and_return(true)
      end

      context 'creates new' do
        it { expect { subject }.to change { Departure.count }.by(1) }
      end

      context 'updates existing one' do
        let!(:departure) { create :departure }
        let(:data) do
          [
            { city: departure.city, flight: departure.flight, time: '18:05' }
          ]
        end

        it { expect { subject }.to change { Departure.count }.by(0) }
        it { expect { subject }.to change { departure.reload.time }.to('18:05') }
      end
    end

    context 'failure' do
      before do
        allow(Departure).to receive(:create).and_raise(StandardError)
      end

      context 'returns blank data' do
        it { expect { subject }.to change { Departure.count }.by(0) }
        it { expect(subject).to eq([]) }
      end
    end
  end
end
